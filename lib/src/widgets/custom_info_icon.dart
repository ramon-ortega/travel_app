import 'package:flutter/material.dart';

class CustomInfoIcon extends StatelessWidget {
  const CustomInfoIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.info,
  });

  final IconData icon;
  final Color iconColor;
  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(106, 119, 139, 1),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              info,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
