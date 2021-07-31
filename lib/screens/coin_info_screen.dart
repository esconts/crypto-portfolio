import 'package:flutter/material.dart';
import 'dart:math' as math;

class CoinInfoPage extends StatefulWidget {
  CoinInfoPage({
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

  @override
  _CoinInfoPageState createState() => _CoinInfoPageState();
}

class _CoinInfoPageState extends State<CoinInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[600],
              size: 28,
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }),
        title: SizedBox(
          width: 38,
          height: 38,
          child: Image.network(widget.image!),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '${widget.name!} (${widget.symbol!})',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$${widget.currentPrice!.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: widget.priceChangePercentage! > 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Transform.rotate(
                                  angle: -90 * math.pi / 180,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.green,
                                    size: 28,
                                  ),
                                ),
                                Text(
                                  '${widget.priceChangePercentage!.toStringAsFixed(2)}%',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[500]),
                                ),
                              ],
                            )
                          : widget.priceChangePercentage! < 0
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                          fontSize: 18,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                          fontSize: 18,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                Row(
                  children: [
                    Text('Price (24h)'),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [Text('Open')],
                                    ),
                                    Row(
                                      children: [Text('\$38.400.00')],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [Text('Open')],
                                    ),
                                    Row(
                                      children: [Text('\$38.400.00')],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [Text('Open')],
                                    ),
                                    Row(
                                      children: [Text('\$38.400.00')],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [Text('Open')],
                                    ),
                                    Row(
                                      children: [Text('\$38.400.00')],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [Text('Open')],
                                    ),
                                    Row(
                                      children: [Text('\$38.400.00')],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [Text('Open')],
                                    ),
                                    Row(
                                      children: [Text('\$38.400.00')],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [
                    //                     Text('Open'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [Text('\$38.438.00')],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [
                    //                     Text('Open'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [Text('\$38.438.00')],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [
                    //                     Text('Open'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [Text('\$38.438.00')],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [
                    //                     Text('Open'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [Text('\$38.438.00')],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [
                    //                     Text('Open'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [Text('\$38.438.00')],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [
                    //                     Text('Open'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Row(
                    //                   children: [Text('\$38.438.00')],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
