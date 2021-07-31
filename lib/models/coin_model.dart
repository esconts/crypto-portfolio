import 'package:flutter/material.dart';

class Coin {
  Coin({
    @required this.name,
    @required this.symbol,
    @required this.image,
    @required this.currentPrice,
    @required this.marketCap,
    @required this.priceChangePercentage,
  });

  String? name;
  String? symbol;
  String? image;
  num? currentPrice;
  num? marketCap;
  double? priceChangePercentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      currentPrice: json['current_price'],
      marketCap: json['market_cap'],
      priceChangePercentage: json['price_change_percentage_24h'],
    );
  }
}

List<Coin> coinList = [];
