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

  void _onInitialize(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      final historyList = await FetchData().getRecentHistory();
      final tempHistoryList = historyList
          .map((map) => RecentHistoryModel(
                map['name'] ?? 'good Lama',
                map['age'] ?? '42 year',
                map['date'] ?? '01/34/33',
                map['weight'] ?? '85 kg',
                map['gender'] ?? 'Male',
                map['title'] ?? 'Diagnostic Test',
                map['code'] ?? 'Z00',
              ))
          .toList();
      emit(state.copyWith(
          isHistoryLoading: false, recentHistoryModelList: tempHistoryList));

      final assessList = await FetchData().getRecentAssessment();
      final tempAssessList = assessList
          .map((map) => RecentAssessmentModel(
              map['code'] ?? 'Z00.89', map['title'] ?? 'Physical Test'))
          .toList();
      emit(state.copyWith(
          isAssesmentLoading: false,
          recentAssessmentModelList: tempAssessList));
    } catch (e) {
      print('Error initializing: $e');
      emit(state.copyWith(isHistoryLoading: false, isAssesmentLoading: false));
    }
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
