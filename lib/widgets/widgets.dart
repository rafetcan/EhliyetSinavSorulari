import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.add,
          color: Colors.black,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 22.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'Ehliyet ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.blue)),
              TextSpan(
                  text: 'Sınav ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black54)),
              TextSpan(
                  text: 'Soruları',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.blue)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget blueButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
  );
}