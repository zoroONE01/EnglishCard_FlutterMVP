import 'package:english_card/data/helpers/dictionary_sqlite_helper.dart';
import 'package:english_card/data/models/vocabalary_remote_free.dart';
import 'package:english_card/data/models/vocabulary_remote.dart';

class VocabularyLocal {
  int? _id;
  String? word;
  String? category;
  String? phonetic;
  String? example;
  String? audio;
  int? isFavourite;

  VocabularyLocal(
      {this.word,
      this.category,
      this.phonetic,
      this.example,
      this.audio,
      this.isFavourite});

  VocabularyLocal.fromRemote(VocabularyRemote vocab) {
    _id = -1;
    word = vocab.word;
    category = vocab.results?.first.lexicalEntries?.first.lexicalCategory?.id;
    phonetic = vocab.results?.first.lexicalEntries?.first.entries?.first
        .pronunciations?.first.phoneticSpelling;
    example = vocab.results?.first.lexicalEntries?.first.entries?.first.senses
        ?.first.examples?.first.text;
    audio = vocab.results?.first.lexicalEntries?.first.entries?.first
        .pronunciations?[1].audioFile;
    isFavourite = 0;
  }

  VocabularyLocal.fromRemoteFree(VocabularyRemoteFree vocab) {
    _id = -1;
    word = vocab.word ?? '';
    category = vocab.meanings?.first.partOfSpeech ?? '';
    phonetic = vocab.phonetic ?? '';
    example = vocab.meanings?.first.definitions?.first.definition ?? '';
    audio = vocab.phonetics?.first.audio ?? '';
    isFavourite = 0;
  }

  VocabularyLocal.fromJson(Map<String, dynamic> json)
      : _id = json[DictionarySqliteHelper.clId],
        word = json[DictionarySqliteHelper.clWord],
        category = json[DictionarySqliteHelper.clCategory],
        phonetic = json[DictionarySqliteHelper.clPhonetic],
        example = json[DictionarySqliteHelper.clExample],
        audio = json[DictionarySqliteHelper.clAudio],
        isFavourite = json[DictionarySqliteHelper.clIsFavourite];

  Map<String, dynamic> toJson() {
    return {
      DictionarySqliteHelper.clId: _id,
      DictionarySqliteHelper.clWord: word,
      DictionarySqliteHelper.clCategory: category,
      DictionarySqliteHelper.clPhonetic: phonetic,
      DictionarySqliteHelper.clExample: example,
      DictionarySqliteHelper.clAudio: audio,
      DictionarySqliteHelper.clIsFavourite: isFavourite
    };
  }

  @override
  String toString() {
    return 'VocabularyLocal{_id: $_id, word: $word, category: $category, phonenic: $phonetic, example: $example, audio: $audio, isFavourite: $isFavourite}';
  }
}
