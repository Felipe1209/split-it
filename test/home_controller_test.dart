import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/shared/models/event_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository{}

void main(){
  late HomeController controller;
  late HomeRepository repository;
  setUp((){
    repository = HomeRepositoryMock();
    controller = HomeController();
  });

  test('Testando o GetEvents - Retornando Success', () async{
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    mobx.autorun((_){
      states.add(controller.state);
    });
    when(repository.getEvents)
        .thenAnswer((_) async => [
          EventModel(title: 'title1', date: DateTime.now(), value: 20, people: 2),
          EventModel(title: 'title2', date: DateTime.now(), value: -12, people: 3)
    ]);
    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 3);
  });

  /*test('Testando o GetEvents - Retornando Failure', () async{
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    mobx.autorun((_){
      states.add(controller.state);
    });
    when(repository.getEvents)
        .thenThrow(UnimplementedError('error'));
    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateFailure>());
    expect(states.length, 3);
  });*/

}