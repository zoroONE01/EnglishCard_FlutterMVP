import 'app_view.dart';

class AppPresenter<T extends AppView>{
  T? view;
  void attachView(T view){
    this.view = view;
  }

  void deAttachView(){
    view = null;
  }

  T? getView() => view;
}