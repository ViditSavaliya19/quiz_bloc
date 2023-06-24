import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/domain/model/data_model.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_event.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_state.dart';
import 'package:quiz_bloc/presentation/quiz/widget/quiz_view.dart';
import 'package:quiz_bloc/presentation/quiz/widget/result_view.dart';

import '../../domain/model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Result> quizList = [];

  @override
  void initState() {
    super.initState();
    // context.read<QuizBloc>()..add(QuizLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is InitialState || state is QuizLoadState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizLoadErrorState) {
              return Center(child: Text("Error ${state.error}",style: TextStyle(color: Colors.white),),);
            } else if (state is QuizLoadedState) {
              quizList = state.quizList;
              return const Text('All Data IS Get');
            } else if (state is NextQuestionState) {
              DataModel r1 = state.r1;
              return QuizView(r1);
            } else if (state is QuizCompletedState) {
              return ResultView(state.point);
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${quizList[index].question}"),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        );
      },
      itemCount: quizList.length,
    );
  }
}
