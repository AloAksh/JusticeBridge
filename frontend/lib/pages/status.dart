import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  void initState() {
    super.initState();
    print("initstate function ran");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Status'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              color: Colors.grey[800],
              height: 24.0,
            ),
            InfoRow(title: 'Case No', value: '2017140'),
            SizedBox(height: 20.0),
            InfoRow(title: 'Legal Rep', value: 'Nagaprasad'),
            SizedBox(height: 20.0),
            InfoText(
              title: 'Documents & Filings',
              description:
              'Notifications about recent filings, responses, or motions related to the case',
            ),
            SizedBox(height: 20.0),
            InfoText(
              title: 'Document Library Access',
              description:
              'Links to legal documents, such as pleadings, motions, and court orders',
            ),
            SizedBox(height: 20.0),
            InfoText(title: 'Nature of Case', description: 'Criminal'),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'inmate1@thenetninja.co.uk',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          value,
          style: TextStyle(
            color: Colors.amberAccent[200],
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}

class InfoText extends StatelessWidget {
  final String title;
  final String description;

  const InfoText({required this.title, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          description,
          style: TextStyle(
            color: Colors.amberAccent[200],
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
