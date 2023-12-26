import 'package:budget_tracker/screen/home_screen.dart';
import 'package:budget_tracker/screen/transaction_screen.dart';
import 'package:budget_tracker/widget/navbar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  int currentIndex = 0;
  var pageViewList = [
    const HomeScreen(),const TransactionScreen()
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      
      body: pageViewList[currentIndex],
    );
  }
}
