import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade100,
        title: const Text(
          'Hello, Reza',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          const Icon(Icons.notifications_none),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.segment_rounded)),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Text('Ok')
          ],
        ),
      ),
    );
  }
}
