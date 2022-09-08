// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String time;

  @override
  void initState() {
    time = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Images",
      "News",
      "Jokes",
      "Quotes",
      "Blogs",
    ];

    final List<Widget> images = [
      Hero(
        tag: "Images",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            "https://images.unsplash.com/photo-1544894079-e81a9eb1da8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: "News",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            "https://images.unsplash.com/photo-1586339949216-35c2747cc36d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fG5ld3N8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: "Jokes",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            "https://images.unsplash.com/photo-1621265054041-e90cefa414a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8am9rZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: "Quotes",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            "https://images.unsplash.com/photo-1617251137884-f135eccf6942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHF1b3Rlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: "Blogs",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            "https://images.unsplash.com/photo-1510442650500-93217e634e4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fGJsb2dzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        title: const Text('Hello, Pramod'),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: VerticalCardPager(
                    titles: titles, // required
                    images: images, // required
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold), // optional
                    onPageChanged: (page) {
                      // optional
                    },
                    onSelectedItem: (index) {
                      // optional
                    },
                    initialPage: 0, // optional
                    align: ALIGN.CENTER // optional
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      time = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
