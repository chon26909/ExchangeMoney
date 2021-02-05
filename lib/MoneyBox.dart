import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MoneyBox extends StatefulWidget {
  String title;
  double amount;
  Color color;
  double size;

  MoneyBox(this.title, this.amount, this.color, this.size);

  @override
  _MoneyBoxState createState() => _MoneyBoxState();
}

class _MoneyBoxState extends State<MoneyBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(10)),
      height: widget.size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###.00").format(widget.amount)}',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
