import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_controller.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository{}

void main(){
  late AppBarController controller;
  late HomeRepository repository;
  setUp((){
    repository = HomeRepositoryMock();
    controller = AppBarController(repository: repository);
  });

  test('Testando o GetDashboard - Retornando Success', () async{
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    //controller.listen((state) => states.add(state));
    when(repository.getDashboard)
        .thenAnswer((_) async => DashboardModel(send: 120, receive: 300));
    await controller.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 2);
  });

  test('Testando o GetDashboard - Retornando Failure', () async{
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    //controller.listen((state) => states.add(state));
    when(repository.getDashboard)
        .thenThrow('erro');
    await controller.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect(states.length, 2);
  });

}