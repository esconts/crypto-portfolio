import 'package:flutter/material.dart';
import 'package:crypto_portfolio/screens/coin_info_screen.dart';
import 'dart:math' as math;

class CoinCard extends StatefulWidget {
  CoinCard({
    @required this.indexOfCoin,
    @required this.name,
    @required this.symbol,
    @required this.image,
    @required this.currentPrice,
    @required this.marketCap,
    @required this.priceChangePercentage,
  });
  int? indexOfCoin;
  String? name;
  String? symbol;
  String? image;
  num? currentPrice;
  num? marketCap;
  double? priceChangePercentage;

  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.none),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoinInfoPage(
                  symbol: widget.symbol,
                  name: widget.name,
                  currentPrice: widget.currentPrice!,
                  image: widget.image,
                  marketCap: widget.marketCap,
                  priceChangePercentage: widget.priceChangePercentage,
                ),
              ),
            ),
            leading: Container(
              width: 240,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.network(widget.image!),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 14,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                widget.name!.length > 15
                                    ? '${widget.name![0]}${widget.name![1]}${widget.name![2]}${widget.name![3]}${widget.name![4]}${widget.name![5]}${widget.name![6]}${widget.name![7]}${widget.name![8]}${widget.name![9]}${widget.name![10]}${widget.name![11]}${widget.name![12]}${widget.name![13]}${widget.name![14]}...'
                                    : widget.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: Colors.grey[200],
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Text(
                                  widget.indexOfCoin!.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                widget.symbol!,
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 12),
                              ),
                              //  SizedBox(width: 3),
                              widget.priceChangePercentage! > 0
                                  ? Row(
                                      children: [
                                        Transform.rotate(
                                          angle: -90 * math.pi / 180,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                        ),
                                        Text(
                                          '${widget.priceChangePercentage!.toStringAsFixed(2)}%',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12),
                                        ),
                                      ],
                                    )
                                  : widget.priceChangePercentage! < 0
                                      ? Row(
                                          children: [
                                            Transform.rotate(
                                              angle: 90 * math.pi / 180,
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.red,
                                                size: 18,
                                              ),
                                            ),
                                            Text(
                                              '${widget.priceChangePercentage!.abs().toStringAsFixed(2)}%',
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 12),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Transform.rotate(
                                              angle: -90 * math.pi / 180,
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                            ),
                                            Text(
                                              '${widget.priceChangePercentage!.abs().toStringAsFixed(2)}%',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.currentPrice!.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'MCap \$${((widget.marketCap!) / 1000000000).toStringAsFixed(2)} Bn',
                      style: TextStyle(
                        color: Colors.grey[500],

                        // fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
