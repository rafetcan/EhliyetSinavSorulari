import 'package:flutter/material.dart';
import 'package:quizmaker/services/datebase.dart';
import 'package:quizmaker/views/addquestion.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription, quizId;
  DatebaseService databaseService = new DatebaseService();

  bool _isLoading = false;

  createQuizOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = "002" + randomAlphaNumeric(16);

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgUrl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescr": quizDescription
      };
      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddQuestion(quizId)));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: _isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Resim URL'sini Girin" : null,
                      decoration: InputDecoration(
                        hintText: 'Sınav Resim Url',
                      ),
                      onChanged: (val) {
                        quizImageUrl = val;
                      },
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Sınav Başlığını Girin" : null,
                      decoration: InputDecoration(
                        hintText: 'Sınav Başlığı',
                      ),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Sınav Açıklamasını Girin" : null,
                      decoration: InputDecoration(
                        hintText: 'Sınav Açıklaması',
                      ),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    Spacer(), // Alta Yasla
                    GestureDetector(
                        onTap: createQuizOnline,
                        child: blueButton(
                            context: context, label: "Sınav Oluştur")),
                    SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
    );
  }
}
