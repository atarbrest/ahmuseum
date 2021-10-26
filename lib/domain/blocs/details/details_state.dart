part of 'details_bloc.dart';

abstract class DetailsState extends BaseState {}

class DetailsInitialState extends DetailsState {}

class Loading extends DetailsState {}

class DetailsFetched extends DetailsState {}

class Error extends DetailsState {}
