import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Add this line

  const MyButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: const Color.fromARGB(211, 189, 90, 83),
        border: Border.all(color: Colors.white12, width: 2.0),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.all(20),
      child: InkWell(
        // Use InkWell for tap effect
        onTap: onPressed, // Assign the onPressed callback
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
