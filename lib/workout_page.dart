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
          backgroundColor: const Color.fromARGB(255, 165, 77, 71), // Use a more appealing color
          title: const Text(
            'Workout Instruction',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24, // Slightly smaller font
              color: Colors.white,
            ),
          ),
          content: const Text(
            'Elliptical Cross: 10 minutes\n\nWorkouts: 5 Sets x 10 Reps\n\nCycling: 10 minutes',
            style: TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.normal, // Use normal font weight for content
              fontSize: 18, // Smaller font size
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
                  fontSize: 18, // Slightly smaller font size
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
      backgroundColor:  Colors.white, // Use a more appealing color
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 165, 77, 71), // Use the same background color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                Text(
                  '\nProtocol $protocolNumber - Day $day',
                  style: const TextStyle(
                    fontSize: 24, // Slightly larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showInfoMessage(context);
                  },
                  icon: const Icon(Icons.info),
                  iconSize: 28, // Slightly smaller icon size
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Add some padding around images
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(12), // Rounded corners for images
                    child: Image.asset(images[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
