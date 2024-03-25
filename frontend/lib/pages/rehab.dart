import 'package:flutter/material.dart';

class Rehab extends StatefulWidget {
  const Rehab({super.key});

  @override
  State<Rehab> createState() => _RehabState();
}

class _RehabState extends State<Rehab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rehabilitation'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Available Resources',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Cards linking to different resources
            ResourceCard(
              title: 'Educational Programs',
              description: 'Access to online learning platforms.',
              onPressed: () {
                // Navigate to educational programs or materials
              },
            ),
            ResourceCard(
              title: 'Counseling Services',
              description: 'Information about available counseling services.',
              onPressed: () {
                // Navigate to counseling services page
              },
            ),
            // Add more ResourceCard widgets for different resources
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Logic to call the helpline
        },
        label: Text('Call Helpline'),
        icon: Icon(Icons.phone),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Widget for a resource card
class ResourceCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const ResourceCard({
    required this.title,
    required this.description,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onPressed,
      ),
    );
  }
}