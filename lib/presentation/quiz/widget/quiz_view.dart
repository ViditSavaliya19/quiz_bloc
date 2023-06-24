import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/domain/model/data_model.dart';
import 'package:quiz_bloc/domain/repository/quiz_repository.dart';

import '../bloc/quiz_bloc.dart';
import '../bloc/quiz_event.dart';

class QuizView extends StatelessWidget {
  DataModel d1;

  QuizView(this.d1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0x3effffff),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Q1 ${d1.question}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if(d1.answer==d1.optionList[index])
                          {
                            QuizRepository.quizRepo.countpoints++;
                            print(QuizRepository.quizRepo.countpoints);
                          }
                        context.read<QuizBloc>().add(NextQuestionEvent());
                      },
                      child: OptionTile(d1.optionList[index], index));
                },
                itemCount: 4,
                physics: NeverScrollableScrollPhysics()),
          ),
        ],
      ),
    );
  }

  Container OptionTile(String optionList, int index) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              ['A', 'B', 'C', 'D'][index],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "$optionList",
            style: TextStyle(
              fontSize: 15,
              color: Colors.indigo.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
