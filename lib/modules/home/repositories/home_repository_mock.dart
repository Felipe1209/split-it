import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository{
  @override
  Future<DashboardModel> getDashboard() async{
    await Future.delayed(Duration(seconds: 2));
    return DashboardModel(send: 1800, receive: 2000);
  }

  @override
  Future<List<EventModel>> getEvents() async{
    await Future.delayed(Duration(seconds: 2));
    return [
      EventModel(title: 'Churrasco', date: DateTime.now(), value: 32, people: 1),
      EventModel(title: 'Almoço', date: DateTime.now(), value: -16, people: 2),
      EventModel(title: 'Steam game', date: DateTime.now(), value: 122, people: 1),
      EventModel(title: 'Churrasco', date: DateTime.now(), value: 15, people: 12),
      EventModel(title: 'Trilheiros', date: DateTime.now(), value: -21, people: 3),
      EventModel(title: 'Jogos', date: DateTime.now(), value: -28, people: 3),
      EventModel(title: 'Churrasco', date: DateTime.now(), value: 40, people: 7),
    ];
  }

}