// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/top_saleman.dart';

part 'top_saleman_event.dart';
part 'top_saleman_state.dart';

class TopSalemanBloc extends Bloc<TopSalemanEvent, TopSalemanState> {
  TopSalemanBloc() : super(TopSalemanInitial()) {

    List<TopSalemanModel> data = <TopSalemanModel>[
      TopSalemanModel('Wendy Harper',15123364.50,0.79,15),
      TopSalemanModel('Aliana Marshall',10409813.08,0.54,10),
      TopSalemanModel('Magaret Clayton',10290654.20,0.54,10),
      TopSalemanModel('Barclay Fields',9635514.04,0.5,12),
      TopSalemanModel('Vita Floyd',7962616.82,0.41,8),
      TopSalemanModel('Trix Dawson',6915887.85,0.36,8),
      TopSalemanModel('Wilona Currey',6895327.09,0.35,6),
      TopSalemanModel('Emily Brooks',6512149.53,0.34,9),
      TopSalemanModel('Myra Berry',6255140.18,0.33,6),
      TopSalemanModel('Garrick Mccoy',6213084.11,0.33,7),
      TopSalemanModel('Cheryl French',6159132.35,0.32,6),
      TopSalemanModel('Leland Shortle',6159132.35,0.32,6),
      TopSalemanModel('Pamela Dennis',6159132.35,0.32,6),
      TopSalemanModel('Hannah Nash',6159132.35,0.32,6),
      TopSalemanModel('Lara Page',6159132.35,0.32,6),
      TopSalemanModel('Morton Baldwin',6159132.35,0.32,6),
      TopSalemanModel('Felicia Hines',6159132.35,0.32,6),
      TopSalemanModel('Bruno Hanson',6159132.35,0.32,6),
      TopSalemanModel('Zach Barrett',6159132.35,0.32,6),
      TopSalemanModel('Luna Goodwin',6159132.35,0.32,6),
    ];

    on<TopSalemanGetData>((event, emit) {
      emit(TopSalemanLoading());
      try {
        emit(TopSalemanLoaded(data));
      } catch (e) {
        emit(TopSalemanFailed());
      }
    });
  }
}
