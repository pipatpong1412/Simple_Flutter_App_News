import 'package:app/models/newspage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreen),
            child: ListTile(
              leading: const Icon(
                Icons.newspaper,
                size: 100,
                color: Colors.white,
              ),
              title: const Text('News',
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 50, color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewsPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
