part of 'details_bloc.dart';

abstract class DetailsEvent extends BaseEvent {}

class FetchDetails extends DetailsEvent {
  final String objectNumber;
  FetchDetails({required this.objectNumber});
}
