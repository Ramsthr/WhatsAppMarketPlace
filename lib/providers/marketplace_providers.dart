import 'package:flutter/material.dart';
import '/models/group.dart';

class MarketplaceProvider with ChangeNotifier {
  List<Group> _groups = [];

  List<Group> get groups => _groups;

  void createGroupWithMarketplace(bool isAdmin) {
    // Simulate API call and group creation
    _groups.add(
        Group(name: 'Sample Group', hasMarketplace: true, isAdmin: isAdmin));
    notifyListeners();
  }

  // Method to toggle the marketplace status for a specific group
  void toggleMarketplaceStatus(Group group) {
    group.hasMarketplace = !group.hasMarketplace;
    notifyListeners();
  }
}
