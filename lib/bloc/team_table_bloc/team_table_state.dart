part of 'team_table_bloc.dart';

abstract class TeamTableState extends Equatable {
  const TeamTableState();
  
  @override
  List<Object> get props => [];
}

class TeamTableInitial extends TeamTableState {}
class TeamTableLoading extends TeamTableState {}
class TeamTableLoaded extends TeamTableState {
  final List<TeamTableModel> getTeamTableData;
  const TeamTableLoaded(this.getTeamTableData);
}
class TeamTableFailed extends TeamTableState {}
