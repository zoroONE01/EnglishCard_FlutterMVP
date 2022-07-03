import 'package:english_card/app/pages/app_presenter.dart';
import 'package:english_card/app/pages/home/home_view.dart';
import 'package:english_card/data/models/vocabulary_local.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/repositories/vocabulary_repository.dart';

class HomePresenter extends AppPresenter<HomeView> {
  int amount = 10;
  int historyAmount = 20;
  VocabularyRepository vocabRepo = VocabularyRepository();

  void getVocabularyFromRemote() async {
    var result = vocabRepo.getRandomVocabularies(amount);
    getView()?.onGetVocabularyFromRemote(result);
  }

  void findTopWordByAmount() async {
    var result = vocabRepo.findTopWordByAmount(historyAmount);
    getView()?.onGetHistory(result);
  }

  void moveToHistory(VocabularyLocal vocab) async {
    VocabularyLocal? result =
        await vocabRepo.findOneByWord(vocab.word.toString());
    if (result == null) {
      vocabRepo.insert(vocab);
      getView()?.onMoveToHistory(1);
    } else {
      getView()?.onMoveToHistory(0);
    }
  }

  void moveToFavourite(VocabularyLocal vocab) async {
    VocabularyLocal? result =
        await vocabRepo.findOneByWord(vocab.word.toString());
    if (result != null) {
      vocab.isFavourite = 1;
      vocabRepo.update(vocab);
      getView()?.onMoveToFavourite(1);
    } else {
      getView()?.onMoveToFavourite(0);
    }
  }

  void playAudio(String audioPath) async {
    final player = AudioPlayer(); // Create a player
    final duration = await player.setUrl(// Load a URL
        audioPath);
    await player.play(); // Play while waiting for completion
  }
}
