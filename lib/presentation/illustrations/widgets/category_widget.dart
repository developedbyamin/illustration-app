import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String imagePath;
  final String description;
  final double radius;
  final double shadowBlurRadius;

  const CategoryWidget({
    super.key,
    required this.imagePath,
    required this.description,
    this.radius = 8.0,
    this.shadowBlurRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: shadowBlurRadius,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image.asset(
              imagePath,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(description, style: const TextStyle(fontFamily: 'TTNorms', color: Color(0xFF979EA6)),),
      ],
    );
  }
}
