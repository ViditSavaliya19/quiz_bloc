import '../../../domain/model/quiz_model.dart';

abstract class QuizEvent {

  QuizEvent();
}

class QuizLoadEvent extends QuizEvent {}

class QuizLoadedEvent extends QuizEvent {
  List<Result> quizList=[];
  QuizLoadedEvent(this.quizList);
}

class NextQuestionEvent extends QuizEvent {
  int qaIndex;
  NextQuestionEvent(this.qaIndex);
}

class QuizLoadedErrorEvent extends QuizEvent {
  String error;
  QuizLoadedErrorEvent(this.error);
}
