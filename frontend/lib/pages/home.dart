import 'package:flutter/material.dart';
import 'package:justice_bridge/services/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  List<String> items = ['status', 'lawyer', 'chatbot', 'abuse', 'rehab', 'logout'];
  String? selectedItem = 'status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Justice bridge',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/status');
                },
                icon: Icon(Icons.format_list_bulleted),
                tooltip: 'Status',
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/rehab');
                },
                icon: Icon(Icons.local_hospital),
                tooltip: 'Rehab',
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/bot');
                },
                icon: Icon(Icons.chat),
                tooltip: 'Chatbot',
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/track');
                },
                icon: const Icon(Icons.location_on),
                tooltip: 'Track',
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lawyer');
                },
                icon: Icon(Icons.people),
                tooltip: 'Lawyer',
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/abuse');
                },
                icon: Icon(Icons.report),
                tooltip: 'Abuse',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/thumb.jpg'),
                ),
              ),
              Divider(
                color: Colors.grey[800],
                height: 30.0,
              ),
              Text(
                'NAME',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[900],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Inmate 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'HOMETOWN',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[900],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Tamilnadu , India',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Nature of crime',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[900],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'criminal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
