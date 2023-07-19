// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../screen/pages/page_screen/chart_components/teams_sale.dart';

part 'team_table_event.dart';
part 'team_table_state.dart';

class TeamTableBloc extends Bloc<TeamTableEvent, TeamTableState> {
  TeamTableBloc() : super(TeamTableInitial()) {
    List<TeamTableModel> data = <TeamTableModel>[
      TeamTableModel("Jim Beck", 100, 152),
      TeamTableModel("Elain Wheatly", 100, 99),
      TeamTableModel("Belinda Carpenter", 100, 132),
      TeamTableModel("Hector Warren", 100, 141),
      TeamTableModel("Eden Guerrero", 100, 112),
      TeamTableModel("Andrea Marrow", 100, 98),
      TeamTableModel("Henrietta Stokes", 100, 144),
      TeamTableModel("Wilona Alvarado", 100, 133),
      TeamTableModel("Winifred Berry", 100, 138),
      TeamTableModel("Justin Tillery", 100, 135),
      TeamTableModel("Georgie Hudson", 100, 135),
      TeamTableModel("Guy Simon", 100, 128),
    ];

    on<TeamTableGetData>((event, emit) {
      emit(TeamTableLoading());
      try {
        emit(TeamTableLoaded(data));
      } catch (e) {
        emit(TeamTableFailed());
      }
    });
  }
}
