import 'package:quiz_bloc/data/api_helper.dart';

import '../model/quiz_model.dart';

class QuizRepository
{
  static final quizRepo =QuizRepository._();
  QuizRepository._();
  QuizModel? quizModel;
  List<Result> result=[];

  Future<void> getQuizData() async {
    quizModel = await ApiHelper.apiHelper.getApiQuizData();
    result =quizModel!.results!;
  }

}