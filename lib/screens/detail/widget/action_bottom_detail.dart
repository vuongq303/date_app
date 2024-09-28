import 'package:flutter/material.dart';

class ActionBottomDetail extends StatelessWidget {
  final ColorScheme colorScheme;

  const ActionBottomDetail({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 250,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 56,
            width: 56,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  spreadRadius: -6,
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.close,
              size: 28,
              color: colorScheme.onPrimary,
            ),
          ),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  spreadRadius: -6,
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.star,
              size: 28,
              color: Colors.white,
            ),
          ),
          Container(
            height: 56,
            width: 56,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: colorScheme.onSecondary,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  spreadRadius: -6,
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.favorite,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}