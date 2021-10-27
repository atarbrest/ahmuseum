part of 'details_bloc.dart';

abstract class DetailsState extends BaseState {
  @override
  List<Object?> get props => [];
}

class DetailsInitialState extends DetailsState {}

class Loading extends DetailsState {}

class DetailsFetched extends DetailsState {}

class Error extends DetailsState {}
