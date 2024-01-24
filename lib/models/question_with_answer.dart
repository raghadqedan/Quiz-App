import 'package:flutter/material.dart';

class QuestionWithAnswer{

final String question;
final List<Answer> answers;
final String correctAnswer;

QuestionWithAnswer({required this.question,required this.answers,required this.correctAnswer});
}


class Answer{
final String text;
final IconData icon;

  Answer({required this.text, required this.icon});



}

List<QuestionWithAnswer> questionsWithAnswers = [
 QuestionWithAnswer(
    question: 'What\'s your favorite color?',
    answers: [
      Answer(
        text: 'Red',
        icon: Icons.circle,
      ),
      Answer(
        text: 'Green',
        icon: Icons.square,
      ),
      Answer(
        text: 'Yellow',
        icon: Icons.star,
      ),
      Answer(
        text: 'Blue',
        icon: Icons.train,
      ),
    ],
    correctAnswer: 'Red',
  ),
  QuestionWithAnswer(
    question: 'What\'s your favorite animal?',
    answers: [
      Answer(
        text: 'Rabbit',
        icon: Icons.add,
      ),
      Answer(
        text: 'Snake',
        icon: Icons.remove,
      ),
      Answer(
        text: 'Elephant',
        icon: Icons.face,
      ),
      Answer(
        text: 'Lion',
        icon: Icons.access_alarm,
      ),
    ],
    correctAnswer: 'Elephant',
  ),
  QuestionWithAnswer(
    question: 'Who\'s your favorite programing language?',
    answers: [
      Answer(
        text: 'Dart',
        icon: Icons.add,
      ),
      Answer(
        text: 'Java',
        icon: Icons.reorder_sharp,
      ),
      Answer(
        text: 'C++',
        icon: Icons.face,
      ),
      Answer(
        text: 'Python',
        icon: Icons.access_alarm,
      ),
    ],
    correctAnswer: 'C++',
  ),
  QuestionWithAnswer(
    question: 'What\'s your favorite sport?',
    answers: [
      Answer(
        text: 'Basketball',
        icon: Icons.food_bank,
      ),
      Answer(
        text: 'soccer',
        icon: Icons.local_pizza,
      ),
      Answer(
        text: 'Volleyball',
        icon: Icons.local_activity,
      ),
      Answer(
        text: 'Jogging',
        icon: Icons.fastfood,
      ),
    ],
    correctAnswer: 'Jogging',
  ),
];

