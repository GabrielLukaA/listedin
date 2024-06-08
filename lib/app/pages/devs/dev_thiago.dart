import 'package:flutter/material.dart';
import 'package:listedin/app/components/footer/footer.dart';
import 'package:listedin/app/data/model/user.dart';
import 'package:listedin/app/pages/config/config.dart';

class DevThiago extends StatefulWidget {
  final String title;

  const DevThiago({super.key, required this.title});

  @override
  State<DevThiago> createState() => _DevThiagoState();
}

class _DevThiagoState extends State<DevThiago> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
           Config(
            isDark: false,
            user: User( id: 1, "testeUserConfig", "estouNaDevthiago@gmail.com"),
           )
          ],
        ),
      ),
      bottomNavigationBar: const Footer(isDark: false,),
    );
  }
}
