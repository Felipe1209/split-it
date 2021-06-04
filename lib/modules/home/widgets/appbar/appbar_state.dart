import 'package:split_it/modules/home/models/dashboard_model.dart';

abstract class AppBarState{}

class AppBarStateEmpty implements AppBarState{}

class AppBarStateLoading implements AppBarState{}

class AppBarStateFailure implements AppBarState{
  final String message;
  AppBarStateFailure({required this.message});
}

class AppBarStateSuccess implements AppBarState{
  final DashboardModel dashboard;
  AppBarStateSuccess({required this.dashboard});
}