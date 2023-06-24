import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_bloc.dart';
import 'package:quiz_bloc/presentation/quiz/bloc/quiz_event.dart';
import 'package:quiz_bloc/presentation/quiz/quiz_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<QuizBloc>(
          create: (context) => QuizBloc()..add(QuizLoadEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => QuizScreen(),
        },
      ),
    ),
  );
}
