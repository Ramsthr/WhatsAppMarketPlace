import 'package:flutter/material.dart';
import '../models/group.dart';

class BrowseItemsScreen extends StatelessWidget {
  final Group group;

  BrowseItemsScreen({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Items'),
      ),
      body: Center(
        child: Text('Browsing Items within ${group.name} Marketplace'),
      ),
    );
  }
}
