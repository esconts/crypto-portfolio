import 'package:flutter/material.dart';
import 'package:crypto_portfolio/screens/coin_prices_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoinPricesScreen(),
    );
  }
}
