import 'package:flutter/material.dart';
import 'package:justice_bridge/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  List<String> items = ['status', 'lawyer','chatbot', 'abuse', 'rehab', 'logout'];
  String? selectedItem = 'status';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Justice bridge'),
        centerTitle: true,
        elevation: 0,
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          onSelected: (String route) {
            Navigator.pushNamed(context, route);
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: '/status',
                child: Text('Status'),
              ),
              const PopupMenuItem(
                value: '/rehab',
                child: Text('Rehab'),
              ),
              const PopupMenuItem(
                value: '/bot',
                child: Text('Chatbot'),
              ),
              const PopupMenuItem(
                value: '/lawyer',
                child: Text('Lawyer'),
              ),
              const PopupMenuItem(
                value: '/abuse',
                child: Text('Abuse'),
              ),
              const PopupMenuItem(
                value: '/',
                child: Text('Logout'),
              ),
            ];
          },
        ),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed:() async{
              await _auth.signOut();
              },
          )
        ],
      ),


      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1234.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
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
                height: 60.0,
              ),
              Text(
                'NAME',
                style: TextStyle(
                  fontSize: 20,
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
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'HOMETOWN',
                style: TextStyle(
                  fontSize: 20,
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
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Nature of crime',
                style: TextStyle(
                  fontSize: 20,
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
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[900],
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'inmate1@thenetninja.co.uk',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: Text('Justice bridge'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // ... Your existing code ...
//
//             // Adding Cards for different routes
//             Card(
//               child: ListTile(
//                 title: Text('Status'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/status');
//                 },
//               ),
//             ),
//             Card(
//               child: ListTile(
//                 title: Text('Rehab'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/rehab');
//                 },
//               ),
//             ),
//             Card(
//               child: ListTile(
//                 title: Text('Lawyer'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/lawyer');
//                 },
//               ),
//             ),
//             Card(
//               child: ListTile(
//                 title: Text('Abuse'),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/abuse');
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
