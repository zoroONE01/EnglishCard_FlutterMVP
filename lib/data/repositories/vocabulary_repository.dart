import 'package:english_card/data/helpers/dictionary_api_free_helper.dart';
import 'package:english_card/data/helpers/dictionary_sqlite_helper.dart';
import 'package:english_card/data/helpers/random_word_api_helper.dart';
import 'package:english_card/data/models/vocabalary_remote_free.dart';
import 'package:english_card/data/models/vocabulary_local.dart';
import 'package:test/expect.dart';

class VocabularyRepository {
  DictionarySqliteHelper vocabularyLocalHelper =
      DictionarySqliteHelper.instance;
  DictionaryApiFreeHelper vocabularyRemoteFreeHelper =
      DictionaryApiFreeHelper();

  Future<void> insert(VocabularyLocal object) async {
    await vocabularyLocalHelper.insert(object.toJson());
  }

  Future<int> update(VocabularyLocal object) async {
    return await vocabularyLocalHelper.update(object.toJson());
  }

  Future<VocabularyLocal?> findOneByWord(String word) async {
    List result = await vocabularyLocalHelper.findOneByWord(word);
    if (result.length > 1) {
      for (var element in result) {
        prints(element.toString());
      }
      return VocabularyLocal.fromJson(result.first);
    } else {
      return null;
    }
  }

  Future<List<VocabularyLocal>> findAll() async {
    List result = await vocabularyLocalHelper.findAll();
    return result.map((e) => VocabularyLocal.fromJson(e)).toList();
  }

  Future<List<VocabularyLocal>> getRandomVocabularies(int amount) async {
    List<VocabularyLocal> vocabularies = [];
    var randomWords = await RandomWordApiHelper().getRequest(amount);
    for (var word in randomWords) {
      print(word);
      try {
        var json = await vocabularyRemoteFreeHelper.getRequest(word);
        print('this: $json');
        VocabularyLocal? vocabulary =
            VocabularyLocal.fromRemoteFree(VocabularyRemoteFree.fromJson(json));
        print(vocabulary.toString());
        if (vocabulary != null) {
          VocabularyLocal? vocab = await findOneByWord(word);
          try {
            if (vocab == null) {
              await vocabularyLocalHelper.insert(vocabulary.toJson());
            }
          } catch (e) {
            print(e.toString());
          }
          vocabularies.add(vocabulary);
        }
      } catch (e) {
        continue;
      }
    }
    return vocabularies;
  }

  Future<List<VocabularyLocal>> findTopWordByAmount(int amount) async {
    List result = await vocabularyLocalHelper.findTopWordByAmount(amount);
    return result.map((e) => VocabularyLocal.fromJson(e)).toList();
  }
}
