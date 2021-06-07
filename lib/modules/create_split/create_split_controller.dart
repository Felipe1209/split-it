class CreateSplitController{
  String eventName = '';

  bool enableButtons(){
    return eventName.isNotEmpty;
  }

  void setEventName(String name){
    eventName = name;
  }

}