import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/domain/model/quiz_model.dart';
import 'package:quiz_bloc/domain/repository/quiz_repository.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_event.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(InitialState()) {
    on<QuizLoadEvent>(
      (event, emit) async {
        emit.call(QuizLoadState());
        try {
          await QuizRepository.quizRepo.getQuizData();
          emit.call(QuizLoadedState(QuizRepository.quizRepo.result));

        } catch (e) {
          emit.call(QuizLoadErrorState(e.toString()));
        }
      },
    );

    on<NextQuestionEvent>((event, emit) {

      emit.call(NextQuestionState(qaIndex));
    });
  }
}
