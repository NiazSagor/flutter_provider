import 'package:expense_tracker_provider/voting_app/provider/voting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VotingProvider>(context);
    final isTie = provider.isTie;
    final winners = provider.winners;
    return Scaffold(
      appBar: AppBar(title: const Text('Result Screen')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.candidates.length,
              itemBuilder: (context, index) {
                final candidate = provider.candidates[index];
                final isWinner = winners.contains(candidate);
                return ListTile(
                  subtitle: isWinner ? Text(isTie ? "Tied" : "Winner") : null,
                  title: Text(
                    candidate.name,
                    style: TextStyle(
                      fontWeight: isWinner ? FontWeight.bold : null,
                      color: isWinner ? Colors.green : null,
                    ),
                  ),
                  trailing: Text("Votes ${candidate.votes}"),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isTie ? Colors.red : Colors.green,
              ),
              textAlign: TextAlign.center,
              isTie
                  ? "It's a tie!"
                  : "Winners: ${winners.map((e) => e.name).join(", ")}",
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
