import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappmarketplace/screens/login.dart';
import '/providers/marketplace_providers.dart';
import '/screens/group_list_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MarketplaceProvider(),
      child: MaterialApp(
        title: 'WhatsApp Group Marketplace',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // home: GroupListScreen(),
        home: LoginPage(),
      ),
    );
  }
}
