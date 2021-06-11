import 'package:mobx/mobx.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store{
  @observable
  int currentPage = 0;

  @action
  void nextPage(){
    currentPage++;
  }

  @action
  void backPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @observable
  String eventName = '';

  @computed
  bool get enableButtons{
    return eventName.isNotEmpty;
  }

  @action
  void setEventName(String name){
    eventName = name;
  }

}