import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/pages/favorites_example/product_page.dart';
import 'package:flutter_provider_state_management/providers/favorite_providers.dart';
import 'package:flutter_provider_state_management/utilities/network_connectivity.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProviders()),
        ChangeNotifierProvider(
            create: (context) => NetworkConnectivityProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Provider State Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const ProductsPage(),
      ),
    );
  }
}
