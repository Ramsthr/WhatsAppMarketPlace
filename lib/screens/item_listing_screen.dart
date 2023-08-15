import 'package:flutter/material.dart';
import '../models/group.dart';

class ItemListingScreen extends StatelessWidget {
  final Group group;

  ItemListingScreen({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List an Item for Sale'),
      ),
      body: Center(
        child: Text('Listing an Item within ${group.name} Marketplace'),
      ),
    );
  }
}
