import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/marketplace_providers.dart'; // Import your MarketplaceProvider class here
import '/models/group.dart';
import './marketplace_screen.dart';
import './group_creation_screen.dart';

// class GroupListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MarketplaceProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WhatsApp Group Marketplace'),
//       ),
//       body: ListView.builder(
//         itemCount: provider.groups.length,
//         itemBuilder: (context, index) {
//           final group = provider.groups[index];
//           return ListTile(
//             title: Text(group.name),
//             subtitle: Text(group.hasMarketplace ? 'Has Marketplace' : ''),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MarketplaceScreen(group: group),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => GroupCreationScreen()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class GroupListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MarketplaceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Group Marketplace'),
      ),
      body: ListView.builder(
        itemCount: provider.groups.length,
        itemBuilder: (context, index) {
          final group = provider.groups[index];
          return ListTile(
            title: Text(group.name),
            subtitle: Text(group.hasMarketplace ? 'Has Marketplace' : ''),
            trailing: group.isAdmin ? Icon(Icons.star) : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MarketplaceScreen(group: group),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupCreationScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
