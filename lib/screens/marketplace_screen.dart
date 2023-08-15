import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/group.dart';
import './browse_items_screen.dart';
import './item_listing_screen.dart';
import '../providers/marketplace_providers.dart';

// class MarketplaceScreen extends StatelessWidget {
//   final Group group;

//   MarketplaceScreen({required this.group});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${group.name} Marketplace'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome to the ${group.name} Marketplace!',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ItemListingScreen(group: group),
//                   ),
//                 );
//               },
//               child: Text('List an Item for Sale'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BrowseItemsScreen(group: group),
//                   ),
//                 );
//               },
//               child: Text('Browse Items'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MarketplaceScreen extends StatelessWidget {
  final Group group;

  MarketplaceScreen({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${group.name} Marketplace'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the ${group.name} Marketplace!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            if (group.isAdmin)
              ElevatedButton(
                onPressed: () {
                  // Toggle the marketplace status
                  Provider.of<MarketplaceProvider>(context, listen: false)
                      .toggleMarketplaceStatus(group);
                },
                child: Text(group.hasMarketplace
                    ? 'Turn Off Marketplace'
                    : 'Turn On Marketplace'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemListingScreen(group: group),
                  ),
                );
              },
              child: Text('List an Item for Sale'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BrowseItemsScreen(group: group),
                  ),
                );
              },
              child: Text('Browse Items'),
            ),
          ],
        ),
      ),
    );
  }
}
