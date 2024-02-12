import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      // backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("kerem dman")

          // buildListviewHorz(context)
        ],
      ),
    );
  }
}

//#192328