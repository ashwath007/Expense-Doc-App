import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'C1', title: 'Car Wash', amount: 500.00, dateTime: DateTime.now()),
    Transaction(
        id: 'C2', title: 'Grocery', amount: 1200.00, dateTime: DateTime.now()),
    Transaction(
        id: 'C3', title: 'Grocery1', amount: 4.00, dateTime: DateTime.now()),
    Transaction(
        id: 'C4',
        title: 'Grocery2',
        amount: 1225400.00,
        dateTime: DateTime.now()),
    Transaction(
        id: 'C5',
        title: 'Grocery3',
        amount: 224474.00,
        dateTime: DateTime.now())
  ];

  void _addTransaction(String title, double amount) {
    final newTrans = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        title: title,
        dateTime: DateTime.now());

    setState(() => {_userTransactions.add(newTrans)});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NewTransaction(_addTransaction),
          TransactionList(_userTransactions)
        ],
      ),
    );
  }
}
