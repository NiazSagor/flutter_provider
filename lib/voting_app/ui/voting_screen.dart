import 'package:expense_tracker_provider/voting_app/provider/voting_provider.dart';
import 'package:expense_tracker_provider/voting_app/ui/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voting App'),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: votingProvider.candidates.length,
              itemBuilder: (context, index) {
                final candidate = votingProvider.candidates[index];
                final isVoted =
                    votingProvider.selectedCandidateId == candidate.id;
                return ListTile(
                  title: Text(candidate.name),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isVoted ? Colors.green : null,
                    ),
                    onPressed: () {
                      votingProvider.vote(candidate.id);
                    },
                    child: Text(
                      "Vote",
                      style: TextStyle(color: isVoted ? Colors.white : null),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ResultScreen(),
              ),
            );
          }, child: Text("Result")),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
