import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;

  Results(
      {@required this.correct, @required this.incorrect, @required this.total});
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.correct} / ${widget.total}",
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(height: 8.0),
              Text(
                "${widget.correct} doğrunuz,\n"
                "${widget.incorrect} yanlışınız var ve \n"
                "${widget.total - widget.incorrect - widget.correct} soru da boş bıraktınız.\n",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, letterSpacing: 3.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14.0),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: blueButton(
                    context: context,
                    label: "Anasayfa'ya dön",
                    buttonWidth: MediaQuery.of(context).size.width / 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
