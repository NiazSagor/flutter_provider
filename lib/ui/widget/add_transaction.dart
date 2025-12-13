import 'package:expense_tracker_provider/model/transaction.dart';
import 'package:expense_tracker_provider/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  bool _isIncome = true;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    Provider.of<TransactionProvider>(context, listen: false).addTransaction(
      Transaction(
        id: DateTime.now().toString(),
        title: enteredTitle,
        amount: enteredAmount,
        date: DateTime.now(),
        isIncome: _isIncome,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: "Amount"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Income",
                style: TextStyle(
                  color: _isIncome ? Colors.green : Colors.black,
                ),
              ),
              Switch(
                value: _isIncome,
                onChanged: (value) {
                  setState(() {
                    _isIncome = value;
                  });
                },
              ),
              Text(
                "Expense",
                style: TextStyle(
                  color: _isIncome == false ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: submitData, child: Text("Add Transaction")),
        ],
      ),
    );
  }
}
