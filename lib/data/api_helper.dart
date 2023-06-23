import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_bloc/domain/model/quiz_model.dart';

class ApiHelper {
  static final apiHelper = ApiHelper._();
  ApiHelper._();

  Future<QuizModel> getApiQuizData() async {
    String apiLink =
        "https://opentdb.com/api.php?amount=10&category=27&difficulty=easy&type=multiple";
    var response = await http.get(Uri.parse(apiLink));
    var json = jsonDecode(response.body);
    print("$json");
    QuizModel quizModel = QuizModel.fromJson(json);
    return quizModel;
  }
}
