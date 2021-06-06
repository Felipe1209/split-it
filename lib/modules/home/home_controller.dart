import 'package:flutter/material.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/shared/models/event_model.dart';

class HomeController{
  final List<EventModel> events = [];
  HomeState state = HomeStateEmpty();
  VoidCallback onUpdate;
  Function(HomeState)? onChange;
  late HomeRepository repository;

  HomeController({required this.onUpdate, HomeRepository? repository}){
    this.repository = repository ?? HomeRepositoryMock();
  }

  getEvents() async{
    try{
      state = HomeStateLoading();
      update();
      List<EventModel> response = await repository.getEvents();
      for(var item in response){
        events.add(item);
      }
      state = HomeStateSuccess(events: events);
      update();
    } catch (error){
      state = HomeStateFailure(message: error.toString());
      update();
    }
  }

  void update(){
    onUpdate();
    if(onChange != null){
      onChange!(state);
    }
  }

  void listen(Function(HomeState) onChange){
    this.onChange = onChange;
  }

}