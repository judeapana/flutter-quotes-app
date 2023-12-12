import 'package:flutter/material.dart';

import '../models/Quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quotes quotes;
  final Function delete;

  const QuoteCard({super.key, required this.quotes, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          quotes.text!,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          quotes.author!,
          textAlign: TextAlign.right,
        ),
        IconButton(
          onPressed: () => delete(),
          icon: Icon(Icons.delete_forever_outlined),
          alignment: Alignment.topRight,
        )
      ]),
    ));
  }
}
