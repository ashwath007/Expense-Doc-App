import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Title expense'),
                  controller: titleController,
                ),
                TextField(
                  autofocus: true,
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      addTransaction(titleController.text,
                          double.parse(amountController.text));
                    },
                    child: Text("Add transaction")),
              ],
            ),
          )),
    );
  }
}
