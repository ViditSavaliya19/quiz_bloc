import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_event.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_state.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<QuizBloc>()..add(QuizLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<QuizBloc, QuizState>(
          bloc: QuizBloc()..add(QuizLoadEvent()),
          builder: (context, state) {
            if (state is InitialState || state is QuizLoadState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is QuizLoadErrorState) {
              return Center(child: Text("Error ${state.error}"));
            }
            if (state is QuizLoadedState) {
              return Center(child: Text('${state.quizList[0].question}'));
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.read<QuizBloc>().add(NextQAEvent());
          },
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
