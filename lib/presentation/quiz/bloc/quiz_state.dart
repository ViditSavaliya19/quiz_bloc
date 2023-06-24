import 'package:quiz_bloc/domain/model/data_model.dart';
import 'package:quiz_bloc/domain/model/quiz_model.dart';

abstract class QuizState {

}

class InitialState extends QuizState {}
class QuizLoadState extends QuizState {}

class QuizLoadedState extends QuizState {
  List<Result> quizList=[];
  QuizLoadedState(this.quizList);
}

class NextQuestionState extends QuizState {
  DataModel r1;
  NextQuestionState(this.r1);
}
class QuizCompletedState extends QuizState {
  int point;
  QuizCompletedState(this.point);
}

class QuizLoadErrorState extends QuizState
{
  String error;
  QuizLoadErrorState(this.error);
}

