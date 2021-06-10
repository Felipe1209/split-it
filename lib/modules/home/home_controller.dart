import 'package:mobx/mobx.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/shared/models/event_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store{
  final List<EventModel> events = [];
  late HomeRepository repository;

  _HomeControllerBase({HomeRepository? repository}){
    this.repository = repository ?? HomeRepositoryMock();
  }

  @observable
  HomeState state = HomeStateEmpty();

  @action
  getEvents() async{
    try{
      state = HomeStateLoading();
      List<EventModel> response = await repository.getEvents();
      for(var item in response){
        events.add(item);
      }
      state = HomeStateSuccess(events: events);
    } catch (error){
      state = HomeStateFailure(message: error.toString());
    }
  }

}