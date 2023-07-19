part of 'team_table_bloc.dart';

abstract class TeamTableEvent extends Equatable {
  const TeamTableEvent();

  @override
  List<Object> get props => [];
}


class TeamTableGetData extends TeamTableEvent {
  
}