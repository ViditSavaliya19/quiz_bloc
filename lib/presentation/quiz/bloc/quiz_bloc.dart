import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/domain/model/quiz_model.dart';
import 'package:quiz_bloc/domain/repository/quiz_repository.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_event.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_state.dart';

import '../../../domain/model/data_model.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  int qaIndex = 0;

  QuizBloc() : super(InitialState()) {
    on<QuizLoadEvent>(
      (event, emit) async {
        emit.call(QuizLoadState());
        try {
          QuizRepository.quizRepo.countpoints=0;
          qaIndex = 0;
          await QuizRepository.quizRepo.getQuizData();
          emit.call(QuizLoadedState(QuizRepository.quizRepo.result));
          DataModel r1 = QuizRepository.quizRepo.getNextQuestion(qaIndex++);
          print(r1.answer);
          emit.call(NextQuestionState(r1));
        } catch (e) {
          emit.call(QuizLoadErrorState(e.toString()));
        }
      },
    );

    on<NextQuestionEvent>((event, emit) {
      if (qaIndex < 10) {
        DataModel r1 = QuizRepository.quizRepo.getNextQuestion(qaIndex++);
        print(r1.answer);
        emit.call(NextQuestionState(r1));
      }
      else
        {
          emit.call(QuizCompletedState(QuizRepository.quizRepo.countpoints));
        }
    });
  }
}
