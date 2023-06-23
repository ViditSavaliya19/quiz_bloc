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
  int qaIndex;
  NextQuestionState(this.qaIndex);
}

class QuizLoadErrorState extends QuizState
{
  String error;
  QuizLoadErrorState(this.error);
}
