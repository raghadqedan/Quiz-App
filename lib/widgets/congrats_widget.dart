import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import '../models/question_with_answer.dart';
class CongratsWidget extends StatelessWidget{
final int score;
final  VoidCallback onTap;
  //bool showAnswer;
final sharedData = const HomePage();

    const CongratsWidget({super.key, required this.score, required this.onTap});
      
        @override
        Widget build(BuildContext context) {
          return 
Column(children:[const Text('Congratulation!',
      style:TextStyle(fontSize: 26,
      fontWeight: FontWeight.w600,
      )
      ),
      const SizedBox(height: 8,),
      Text(
          'Your score: $score/${questionsWithAnswers.length}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8,),
        TextButton(onPressed: onTap, child: const Text('Reset Quiz')),
        
      ])
      ;
        }


}