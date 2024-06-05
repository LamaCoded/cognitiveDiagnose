part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  List<RecentHistoryModel> recentHistoryModelList;
  List<RecentAssessmentModel> recentAssessmentModelList;
  List<Map<String, dynamic>> selectedCognition;
  bool isHistoryLoading = true;
  bool isAssesmentLoading = true;

  HomeState(
      {this.recentHistoryModelList = const [],
      this.recentAssessmentModelList = const [],
      this.selectedCognition = const [],
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
    List<Map<String, dynamic>>? selectedCognition,
    bool? isAssesmentLoading,
    bool? isHistoryLoading,
  }) {
    return HomeState(
      recentHistoryModelList:
          List.from(recentHistoryModelList ?? this.recentHistoryModelList),
      recentAssessmentModelList: List.from(
          recentAssessmentModelList ?? this.recentAssessmentModelList),
      selectedCognition: List.from(selectedCognition ?? this.selectedCognition),
      isHistoryLoading: isHistoryLoading ?? this.isHistoryLoading,
      isAssesmentLoading: isAssesmentLoading ?? this.isAssesmentLoading,
    );
  }
}
