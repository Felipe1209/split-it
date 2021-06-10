import 'package:mobx/mobx.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_state.dart';

part 'appbar_controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store{
  late HomeRepository repository;

  @observable
  AppBarState state = AppBarStateEmpty();

  _AppBarControllerBase({HomeRepository? repository}){
    this.repository = repository ?? HomeRepositoryMock();
  }

  @action
  getDashboard() async{
    try {
      state = AppBarStateLoading();
      final response = await repository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
    } catch(error){
      state = AppBarStateFailure(message: error.toString());
    }
  }

}