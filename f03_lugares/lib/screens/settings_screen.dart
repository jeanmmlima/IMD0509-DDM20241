import 'package:f03_lugares/components/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Center(
        child: Text('Configurações', style: TextStyle(fontSize: 20),),
      ),
      drawer: MainDrawer(),
    );
  }
}
