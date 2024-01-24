import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/congrats_widget.dart';
import 'package:quiz_app/widgets/answer_widget_item.dart';
import 'package:quiz_app/widgets/main_button.dart';
import '../models/question_with_answer.dart';



bool showAnswer=false;
bool lock=true;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
      int questionIndex=0;
      bool isFinished=false;
      int score=0;
      bool isFinalQestion=false;
      String? selectedAnswer;
      bool isSelected=false;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child:Center(child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        child: !isFinished ? Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:  [  
            const SizedBox(height: 16,),
            Text(questionsWithAnswers[questionIndex].question,
            style: const TextStyle(fontSize: 24,
            fontWeight: FontWeight.w600
            ),
            ),
            const SizedBox(height: 16,),
            const Text('Answer and get points ',style:TextStyle(color:AppColors.grey,
            fontSize: 17,
            )),
            const SizedBox(height: 36,),
            RichText(text:TextSpan(text:'step $questionIndex ',style:const TextStyle(color: AppColors.black,fontSize: 16),
            children:[ TextSpan(text:'of ${questionsWithAnswers.length}',
            style: TextStyle(color: AppColors.black.withOpacity(0.3),fontSize: 16))] ),),
            const SizedBox(height: 8,),
        Column(
          children:questionsWithAnswers[questionIndex].answers.map(
            (answer)=>AnswerWidgetItem(answer:answer,
            selectedAnswer:selectedAnswer,
            correctAnswer: questionsWithAnswers[questionIndex].correctAnswer,
            isCorrect:selectedAnswer==questionsWithAnswers[questionIndex].correctAnswer,
            onTap:() {
              setState(() {
                if(lock){
                  selectedAnswer=answer.text;
                  isSelected=true;
                  selectedAnswer==questionsWithAnswers[questionIndex].correctAnswer;
                }else{ ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                      content: Text('Sorry, you select answer alredy ',style:TextStyle(color: AppColors.green),), duration: Duration(seconds: 2),behavior: SnackBarBehavior.floating,),
                  ); 
                }
            });
            },
            )
            ).toList(),
          ),
          const Spacer(),//
  
          SizedBox(width:double.infinity,height: 50,
            child:MainButton(
            text:'showAsnwer',
            onPressed: () {
            setState(() {
            if(isSelected==true){
              showAnswer=showAnswer?false:true;
              lock=false;
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an answer',
                      style:TextStyle(color: AppColors.green),),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
          }
        });
        },),
      ),
        const SizedBox(height: 36,),
            if (isSelected &&showAnswer)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                          color:  AppColors.green,
                          borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Correct Answer: ${questionsWithAnswers[questionIndex].correctAnswer}',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
      SizedBox(
        width: double.infinity,
        height: 50,
        child:!isFinalQestion? MainButton(text:'Next',
        onPressed: (){
              setState(() {
                showAnswer=false;
                  final questionObt=questionsWithAnswers[questionIndex];
                    if(isSelected==true){
                    if(selectedAnswer == questionObt.correctAnswer){
                      score++;
                    }
                if(questionIndex<questionsWithAnswers.length-1 ){
                    questionIndex++;
                    isSelected=false;
                    lock=true;
                }
                    else {
                    isFinished=true;
                    }
                    }
                    else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an answer',
                      style:TextStyle(color: AppColors.green),),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }    
                if(questionIndex==questionsWithAnswers.length-1){
                    isFinalQestion=true;
                }  
              });
          },):MainButton(text:'submit',
                onPressed: (){
                    setState(() {
                    showAnswer=false;
                    lock=true;
                    final questionObt=questionsWithAnswers[questionIndex];
                    if(isSelected==true){
                    if(selectedAnswer == questionObt.correctAnswer){
                      score++;
                    }
                    if(questionIndex<questionsWithAnswers.length-1 ){
                      questionIndex++;
                      isSelected=false;
                    }
                    else {
                    isFinished=true;
                    }
                    if(questionIndex==questionsWithAnswers.length-1){
                      isFinalQestion=false;
                    }    
                    }
                    else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                          content: Text('Please select an answer',
                          style:TextStyle(color: AppColors.green),),
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          ),
                        );
                    }
              });
          },)
      )
      ],)      
      : CongratsWidget(score:score,onTap:() {
    setState(() {
      questionIndex=0;
      isFinished=false;
      score=0;
      showAnswer=false;
      isSelected=false;

    });
  },
)
      ),
    ),
      )
    );
  }
}