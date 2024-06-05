part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  // List<Map<String, dynamic>> recentHistoryModelList;
  // List<Map<String, dynamic>> recentAssessmentModelList;
  List<RecentHistoryModel> recentHistoryModelList;
  List<RecentAssessmentModel> recentAssessmentModelList;
  bool isHistoryLoading = true;
  bool isAssesmentLoading = true;

  HomeState(
      {this.recentHistoryModelList = const [],
      this.recentAssessmentModelList = const [],
      this.isHistoryLoading = true,
      this.isAssesmentLoading = true});

  @override
  List<Object?> get props => [
        recentHistoryModelList,
        recentAssessmentModelList,
        isHistoryLoading,
        isAssesmentLoading
      ];

  HomeState copyWith({
    List<RecentHistoryModel>? recentHistoryModelList,
    List<RecentAssessmentModel>? recentAssessmentModelList,
    bool? isAssesmentLoading,
    bool? isHistoryLoading,
  }) {
    return HomeState(
      recentHistoryModelList:
          List.from(recentHistoryModelList ?? this.recentHistoryModelList),
      recentAssessmentModelList: List.from(
          recentAssessmentModelList ?? this.recentAssessmentModelList),
      isHistoryLoading: isHistoryLoading ?? this.isHistoryLoading,
      isAssesmentLoading: isAssesmentLoading ?? this.isAssesmentLoading,
    );
  }
}
