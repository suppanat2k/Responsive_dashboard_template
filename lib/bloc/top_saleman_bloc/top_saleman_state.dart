part of 'top_saleman_bloc.dart';

abstract class TopSalemanState extends Equatable {
  const TopSalemanState();
  
  @override
  List<Object> get props => [];
}

class TopSalemanInitial extends TopSalemanState {}
class TopSalemanLoading extends TopSalemanState {}
class TopSalemanLoaded extends TopSalemanState {
  final List<TopSalemanModel> getTopSalemanData;
  const TopSalemanLoaded(this.getTopSalemanData);
}
class TopSalemanFailed extends TopSalemanState {}
