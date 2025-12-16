// Source - https://stackoverflow.com/q
// Posted by Satyajyoti Biswas, modified by community. See post 'Timeline' for change history
// Retrieved 2025-12-16, License - CC BY-SA 4.0

import 'package:expense_tracker_provider/contact/provider/provider_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderService plService = Provider.of<ProviderService>(
      context,
      listen: false,
    );
    print("build(BuildContext context)");
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String _name = plService.totalNames[index];
            return Selector<ProviderService, List<String>>(
              child: Center(
                child: Text(
                  'No names have been found',
                  textAlign: TextAlign.center,
                ),
              ),
              selector: (_, service) => service.selectedNames,
              builder: (context, selNames, child) {
                return ListTile(
                  title: Text('$_name'),
                  trailing: Icon(
                    Icons.check_circle,
                    color: selNames.contains(_name)
                        ? Colors.lightGreen
                        : Colors.transparent,
                  ),
                  onTap: () {
                    context.read<ProviderService>().updateselectedNames(_name);
                  },
                );
              },
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: plService.totalNames.length,
        ),
      ),
    );
  }
}
