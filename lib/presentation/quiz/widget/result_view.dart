import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_event.dart';

class ResultView extends StatelessWidget {
  int point;

  ResultView(this.point, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            point > 4 ? "assets/images/win.png" : "assets/images/loser.png",
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "$point/10 Score",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              context.read<QuizBloc>().add(QuizLoadEvent());
            },
            child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 1)),
                alignment: Alignment.center,
                child: const Text(
                  "ReExam",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                )),
          ),
        ],
      ),
    );
  }
}
