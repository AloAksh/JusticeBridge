import 'package:flutter/material.dart';

class Abuse extends StatefulWidget {
  const Abuse({super.key});

  @override
  State<Abuse> createState() => _AbuseState();
}

class _AbuseState extends State<Abuse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Abuse'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Report Abuse',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Type of Abuse',
                border: OutlineInputBorder(),
              ),
              // Handle input for the type of abuse (e.g., physical, verbal, etc.)
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              // Allow the user to describe the abuse incident
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to handle submitting the abuse report
                // This might involve sending the report to appropriate authorities or storing it in a database
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Know Your Rights',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Legal Rights Handbook'),
              onTap: () {
                // Navigate to a page or open a document displaying legal rights information
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Prisoner Rights Information'),
              onTap: () {
                // Navigate to a page or open a document providing prisoner rights information
              },
            ),
            // Add more ListTile widgets for additional resources or materials about legal rights
          ],
        ),
      ),
    );
  }
}
