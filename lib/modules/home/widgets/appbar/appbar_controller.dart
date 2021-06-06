import 'package:flutter/material.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_state.dart';

class AppBarController{
  late HomeRepository repository;
  Function(AppBarState)? onChange;
  VoidCallback onUpdate;

  AppBarState state = AppBarStateEmpty();

  AppBarController({required this.onUpdate, HomeRepository? repository}){
    this.repository = repository ?? HomeRepositoryMock();
  }

  getDashboard() async{
    try {
      state = AppBarStateLoading();
      update();
      final response = await repository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
      update();
    } catch(error){
      state = AppBarStateFailure(message: error.toString());
      update();
    }
  }

  void update(){
    onUpdate();
    if(onChange != null){
      onChange!(state);
    }
  }

  void listen(Function(AppBarState) onChange){
    this.onChange = onChange;
  }

}