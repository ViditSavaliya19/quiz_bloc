import 'package:quiz_bloc/data/api_helper.dart';
import 'package:quiz_bloc/domain/model/data_model.dart';

import '../model/quiz_model.dart';

class QuizRepository {
  static final quizRepo = QuizRepository._();

  QuizRepository._();

  QuizModel? quizModel;
  List<Result> result = [];
  int countpoints=0;

  Future<void> getQuizData() async {
    quizModel = await ApiHelper.apiHelper.getApiQuizData();
    result = quizModel!.results!;
  }

  DataModel getNextQuestion(int index) {
    List<String> l1 = result[index].incorrectAnswers!;
    l1.add(result[index].correctAnswer!);
    l1.shuffle();

    DataModel dataModel = DataModel(
        question: result[index].question,
        answer: result[index].correctAnswer,
        optionList: l1);
    return dataModel;
  }
}
