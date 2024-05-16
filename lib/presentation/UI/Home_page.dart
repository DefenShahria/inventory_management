import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.segment_rounded),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigoAccent.shade100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    // You can replace this placeholder image with the user's profile image
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Reza',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'reza@example.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            // Add more list items or widgets as needed
          ],
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Text('Ok'),
          ],
        ),
      ),
    );
  }
}
