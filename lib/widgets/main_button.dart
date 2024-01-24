import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class MainButton extends StatelessWidget {
final String text;
final VoidCallback onPressed;

  const MainButton({super.key, required this.text, required this.onPressed});

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onPressed,
          style:ElevatedButton.styleFrom(
            backgroundColor: AppColors.black,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
            ),
          child: Text(text),
            
      );
  }
}