import 'package:flutter/material.dart';

import '../modals/user_modal.dart';

class DashboardPage extends StatefulWidget{
  final User user;
  const DashboardPage({super.key , required this.user});
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}