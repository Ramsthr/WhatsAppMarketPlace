import 'package:flutter/material.dart';
import '../providers/marketplace_providers.dart';
import 'package:provider/provider.dart';

class GroupCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group with Marketplace'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<MarketplaceProvider>(context, listen: false)
                .createGroupWithMarketplace(true);
            Navigator.pop(context);
          },
          child: Text('Create Group'),
        ),
      ),
    );
  }
}
