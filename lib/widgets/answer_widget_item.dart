import'package:flutter/material.dart';
import '../models/question_with_answer.dart';
import '../utils/app_colors.dart';

class AnswerWidgetItem extends StatelessWidget{
  final Answer answer;
  final String? selectedAnswer;
   bool isCorrect=false;
  final VoidCallback onTap;
  String? correctAnswer;

  AnswerWidgetItem({super.key, required this.answer, this.selectedAnswer, required this.onTap, required this.isCorrect,required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            // color: selectedAnswer == answer.text
            //    ?  AppColors.green
            //     : AppColors.white,
            color:selectedAnswer == answer.text
              ? AppColors.green.withOpacity(0.7)
              : AppColors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  answer.icon,
                  color: selectedAnswer == answer.text
                      ? AppColors.white
                      : AppColors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  answer.text,
                  style: TextStyle(
                    color: selectedAnswer == answer.text
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
}