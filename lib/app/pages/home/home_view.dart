import 'package:english_card/app/pages/app_view.dart';
import 'package:english_card/data/models/vocabulary_local.dart';

abstract class HomeView extends AppView {
  void onGetVocabularyFromRemote(Future<List<VocabularyLocal>> vocabs);

  void onGetHistory(Future<List<VocabularyLocal>> recentVocabs);

  void onMoveToHistory(int result);

  void onMoveToFavourite(int result);

  void onPlayAudio();

// bool onIsFavourite(String word);
//
// bool onIsHistory(String word);
}
