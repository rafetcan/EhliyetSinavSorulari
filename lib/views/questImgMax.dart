import 'package:flutter/material.dart';

class QuestImgMaximize extends StatelessWidget {
  final String imgUrl;

  const QuestImgMaximize({Key key, this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Spacer(),
          Container(
            child: Image.network(imgUrl),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(
                'Geri Dön',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
          ),
          Spacer()
        ],
      ),
    ));
  }
}
