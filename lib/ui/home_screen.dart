import 'package:expense_tracker_provider/ui/widget/add_transaction.dart';
import 'package:expense_tracker_provider/ui/widget/summary_card.dart';
import 'package:expense_tracker_provider/ui/widget/transaction_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTransaction(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SummaryCard(),
          Expanded(child: TransactionList()),
        ],
      ),
    );
  }
}
