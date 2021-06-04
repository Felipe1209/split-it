import 'package:split_it/modules/shared/models/event_model.dart';

abstract class HomeState{}

class HomeStateEmpty implements HomeState{}

class HomeStateLoading implements HomeState{}

class HomeStateFailure implements HomeState{
  final String message;
  HomeStateFailure({required this.message});
}

class HomeStateSuccess implements HomeState{
  final List<EventModel> events;
  HomeStateSuccess({required this.events});
}