part of 'home_bloc.dart';

@immutable
class HomeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeInitialEvent extends HomeEvent {}

class RecentHistoryItemFetchEvent extends HomeEvent {}

class RecentAssessmentItemFetchEvent extends HomeEvent {}

class onSelectCognitionEvent extends HomeEvent {
  final Map<String, dynamic> payload;

  onSelectCognitionEvent({required this.payload});
}
