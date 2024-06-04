import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measureap/data/connection.dart';
import 'package:measureap/presentation/HomePage/model/recent_assessment_model.dart';
import 'package:measureap/presentation/HomePage/model/recent_history_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<RecentHistoryItemFetchEvent>(_onHistoryFetch
        as EventHandler<RecentHistoryItemFetchEvent, HomeState>);
    on<RecentAssessmentItemFetchEvent>(_onAssessmentFetch
        as EventHandler<RecentAssessmentItemFetchEvent, HomeState>);
  }

  void _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) {
    final historyStream = FetchData().getRecentHistory();
    final assessStream = FetchData().getRecentAssessment();

    List<RecentHistoryModel> tempRecentHistoryList = [
      RecentHistoryModel('prajwol', 'asd', 'as', "asd", 'asd', 'title', 'code')
    ];
    List<RecentAssessmentModel> tempRecentAssessmentList = [];

    historyStream.listen(
      (List<Map<String, dynamic>> recentHistoryList) {
        tempRecentHistoryList = recentHistoryList.map((map) {
          print(map['name']);
          return RecentHistoryModel(
            map['name'] ?? 'prajwol Lama',
            map['age'] ?? '42 year',
            map['date'] ?? '01/34/33',
            map['weight'] ?? '85 kg',
            map['gender'] ?? 'Male',
            map['title'] ?? 'Diagnostic Test',
            map['code'] ?? 'Z00',
          );
        }).toList();
        print(tempRecentHistoryList);
      },
      onError: (error) {
        print('Error fetching Recent History: $error');
      },
    );

    assessStream.listen(
      (List<Map<String, dynamic>> recentAssessmentList) {
        tempRecentAssessmentList = recentAssessmentList.map((map) {
          return RecentAssessmentModel(
              map['code'] ?? 'Z00.89', map['title'] ?? 'Physical Test');
        }).toList();
        print(recentAssessmentList);
      },
      onError: (error) {
        print('Error fetching Recent Assessments: $error');
      },
    );
    emit(state.copyWith(
      isLoading: false,
      recentAssessmentModelList: tempRecentAssessmentList,
      recentHistoryModelList: tempRecentHistoryList,
    ));
  }

  _onHistoryFetch(
    RecentHistoryItemFetchEvent event,
    Emitter<HomeState> emit,
  ) {}
  _onAssessmentFetch(
    RecentAssessmentItemFetchEvent event,
    Emitter<HomeState> emit,
  ) {}
}
