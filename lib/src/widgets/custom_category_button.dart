import 'package:flutter/material.dart';

class CustomCategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int index;
  final Function(int) onPressed;
  final IconData icon;

  const CustomCategoryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
    required this.icon,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: ElevatedButton.icon(
        onPressed: () => onPressed(index),
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.red,
        ),
        label: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.red,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? Colors.red : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}
