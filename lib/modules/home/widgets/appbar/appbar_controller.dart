import 'package:flutter/material.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_state.dart';

class AppBarController{
  late HomeRepository repository;

  AppBarState state = AppBarStateEmpty();

  AppBarController(){
    repository = HomeRepositoryMock();
  }

  getDashboard({required VoidCallback onUpdate}) async{
    try {
      state = AppBarStateLoading();
      onUpdate();
      final response = await repository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
      onUpdate();
    } catch(error){
      state = AppBarStateFailure(message: error.toString());
      onUpdate();
    }

  }

}