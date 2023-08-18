import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  final int protocolNumber;
  final int day;

  const WorkoutPage({
    required this.protocolNumber,
    required this.day,
    Key? key,
  }) : super(key: key);

  List<String> getWorkoutImages(int day) {
    List<String> images = [];
    for (int i = 1; i <= 8; i++) {
      images.add('assets/protocol1/day 1/day1_image1.jpg');
    }
    return images;
  }

  void _showInfoMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(179, 221, 110, 110),
          title: const Text(
            'Workout Instruction',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          content: const Text(
            'Elliptical Cross: 10 minutes\n\nWorkouts: 5 Sets x 10 Reps\n\nCycling: 10 minutes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = getWorkoutImages(day);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 77, 71),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 165, 77, 71),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Protocol $protocolNumber - Day $day Workouts',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    height: 3,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    onPressed: () {
                      _showInfoMessage(context);
                    },
                    icon: const Icon(Icons.info),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.asset(images[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
