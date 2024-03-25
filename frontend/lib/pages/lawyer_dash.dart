// import 'package:flutter/material.dart';
//
// // Define a data model for prisoners
// class Prisoner {
//   final String name;
//   final double severityIndex;
//
//   Prisoner({required this.name, required this.severityIndex});
// }
//
// // Backend service/provider to fetch prisoner data (replace with your implementation)
// class PrisonerService {
//   List<Prisoner> getPrisoners() {
//     // Fetch prisoners from backend or database
//     return [
//       Prisoner(name: 'John Doe', severityIndex: 8.5),
//       Prisoner(name: 'Jane Smith', severityIndex: 7.2),
//       Prisoner(name: 'Michael Johnson', severityIndex: 9.0),
//       // Add more prisoners as needed
//     ];
//   }
// }
//
// class LawyerDashboard extends StatelessWidget {
//   final PrisonerService prisonerService = PrisonerService();
//
//   @override
//   Widget build(BuildContext context) {
//     List<Prisoner> prisoners = prisonerService.getPrisoners();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lawyer Dashboard'),
//       ),
//       body: ListView.builder(
//         itemCount: prisoners.length,
//         itemBuilder: (context, index) {
//           final prisoner = prisoners[index];
//           return ListTile(
//             title: Text(prisoner.name),
//             subtitle: Text('Severity Index: ${prisoner.severityIndex}'),
//             // Add onTap to view details of each prisoner if needed
//           );
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: LawyerDashboard(),
//   ));
// }

import 'package:flutter/material.dart';

// Define a data model for prisoners
class Prisoner {
  final String name;
  final double severityIndex;

  Prisoner({required this.name, required this.severityIndex});
}

// Backend service/provider to fetch prisoner data (replace with your implementation)
class PrisonerService {
  List<Prisoner> getPrisoners() {
    // Fetch prisoners from backend or database
    return [
      Prisoner(name: 'John Doe', severityIndex: 8.5),
      Prisoner(name: 'Jane Smith', severityIndex: 7.2),
      Prisoner(name: 'Michael Johnson', severityIndex: 9.0),
      // Add more prisoners as needed
    ];
  }
}

class LawyerDashboard extends StatelessWidget {
  final PrisonerService prisonerService = PrisonerService();

  @override
  Widget build(BuildContext context) {
    List<Prisoner> prisoners = prisonerService.getPrisoners();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyer Dashboard'),
      ),
      body: ListView.builder(
        itemCount: prisoners.length,
        itemBuilder: (context, index) {
          final prisoner = prisoners[index];
          return ListTile(
            title: Text(prisoner.name),
            subtitle: Text('Severity Index: ${prisoner.severityIndex}'),
            onTap: () {
              _showPrisonerDetails(context, prisoner);
            },
          );
        },
      ),
    );
  }

  void _showPrisonerDetails(BuildContext context, Prisoner prisoner) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Prisoner Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${prisoner.name}'),
              Text('Severity Index: ${prisoner.severityIndex}'),
              // Add more prisoner details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
