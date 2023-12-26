import 'package:budget_tracker/screen/login_screen.dart';
import 'package:budget_tracker/widget/add_transaction_form.dart';
import 'package:budget_tracker/widget/hero_card.dart';
import 'package:budget_tracker/widget/transaction_card.dart';
import 'package:budget_tracker/widget/transactions_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var islogoutLoading = false;
  
  void logOut() async {
    setState(() {
      islogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    }
    setState(() {
      islogoutLoading = false;
    });
  }
final userId = FirebaseAuth.instance.currentUser!.uid;
  _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: AddTransactionForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          _dialogBuilder(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: islogoutLoading
                  ? const CircularProgressIndicator()
                  : const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCard(
              userId: userId,
            ),
            TransactionsCard()
          ],
        ),
      ),
    );
  }
}
