import 'package:flutter/services.dart';

import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 'C1', title: 'Car Wash', amount: 500.00, dateTime: DateTime.now()),
    Transaction(
        id: 'C2', title: 'Grocery', amount: 1200.00, dateTime: DateTime.now())
  ];

  String titleInput;
  String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Expense App"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  child: Text("first"),
                  width: double.infinity,
                  color: Colors.blue,
                ),
                elevation: 5,
              ),
              Card(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          decoration:
                              InputDecoration(labelText: 'Title expense'),
                          controller: titleController,
                        ),
                        TextField(
                          autofocus: true,
                          controller: amountController,
                          decoration: InputDecoration(labelText: 'Amount'),
                        ),
                        FlatButton(
                            textColor: Colors.purple,
                            onPressed: () {},
                            child: Text("Add transaction")),
                      ],
                    ),
                  )),
              Column(
                children: transaction.map((e) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${e.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.brown),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            e.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMMMd().format(e.dateTime),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ));
                }).toList(),
              )
            ],
          )),
    );
  }
}
