import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:listedin/app/components/footer/footer.dart';
import 'package:listedin/app/components/header/header.dart';
import 'package:listedin/app/data/model/user.dart';
import 'package:listedin/app/styles/colors.dart';

class Config extends  StatelessWidget{
  
  bool isDark;
  final User user;

  const Config({super.key, required this.isDark, required this.user});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 104, width: 24,),
                Container(
                    height: 64,
                    width: 64,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primary,
                    ),
                ),
                const SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: TextStyle(fontSize: 20),),
                    Text(user.email)
                  ],
                )  
              ]
            ),
            const SizedBox(height: 24,),
             Column(
              
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Modo escuro"),
                    ToggleSwitch(onChangeFunction: () => {isDark = !isDark}, isDark: isDark,)
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("texto"),
                    Text("Input")
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("texto"),
                    Text("Input")
                  ],
                ),
              ],
            )
        ],
        ),



      bottomNavigationBar: Footer(isDark: isDark, key: key,),
    );
  }

} 



class ToggleSwitch extends StatefulWidget {
  final bool isDark;
  final onChangeFunction;
  const ToggleSwitch({super.key, required this.onChangeFunction, required this.isDark});

  @override
  ToggleSwitchState createState() => ToggleSwitchState();
}

class ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: widget.onChangeFunction,
      // inactiveTrackColor: darkModal,
      activeTrackColor: darkModal,
      activeColor: darkModal,

    );
  }
}