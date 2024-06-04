part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final List<RecentHistoryModel> recentHistoryModelList;
  final List<RecentAssessmentModel> recentAssessmentModelList;
  bool isLoading = true;

  HomeState(
      {this.recentHistoryModelList = const [],
      this.recentAssessmentModelList = const [],
      this.isLoading = true});

  @override
  List<Object?> get props =>
      [recentHistoryModelList, recentAssessmentModelList, isLoading];

  HomeState copyWith({
    List<RecentHistoryModel>? recentHistoryModelList,
    List<RecentAssessmentModel>? recentAssessmentModelList,
    bool? isLoading,
  }) {
    return HomeState(
        recentHistoryModelList:
            recentHistoryModelList ?? this.recentHistoryModelList,
        recentAssessmentModelList:
            recentAssessmentModelList ?? this.recentAssessmentModelList,
        isLoading: isLoading ?? this.isLoading);
  }
}
