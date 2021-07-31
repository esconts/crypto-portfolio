import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_portfolio/models/coin_model.dart';
import 'package:crypto_portfolio/widgets/coin_card.dart';

class CoinPricesScreen extends StatefulWidget {
  @override
  _CoinPricesScreenState createState() => _CoinPricesScreenState();
}

class _CoinPricesScreenState extends State<CoinPricesScreen> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.grey[600],
            size: 28,
          ),
          onPressed: () {
            setState(() {
              fetchCoin();
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 28,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ],
        title: Text(
          'CRYPTOPORTFOLIO',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: coinList.length,
                itemBuilder: (context, index) {
                  return CoinCard(
                    indexOfCoin: index + 1,
                    name: coinList[index].name,
                    symbol: coinList[index].symbol!.toUpperCase(),
                    image: coinList[index].image,
                    currentPrice: coinList[index].currentPrice,
                    marketCap: coinList[index].marketCap,
                    priceChangePercentage:
                        coinList[index].priceChangePercentage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
