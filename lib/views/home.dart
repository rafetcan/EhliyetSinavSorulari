import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/services/datebase.dart';
import 'package:quizmaker/views/create_quiz.dart';
import 'package:quizmaker/views/play_quiz.dart';
import 'package:quizmaker/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizStream;
  var quizler;

  DatebaseService datebaseService = new DatebaseService();

  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  // itemCount: snapshot.data.documents.length,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return QuizTitle(
                      imgUrl: snapshot.data.documents[index].data["quizImgUrl"],
                      title: snapshot.data.documents[index].data["quizTitle"],
                      desc: snapshot.data.documents[index].data["quizDescr"],
                      quizid: snapshot.data.documents[index].data["quizId"],
                    );
                  },
                );
        },
      ),
    );
  }

  @override
  void initState() {
    datebaseService.getQuizezData().then((val) {
      setState(() {
        quizStream = val;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(
        //       Icons.menu,
        //       color: Colors.black87,
        //     ),
        //     onPressed: null),
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.exit_to_app,
        //         color: Colors.red.shade900,
        //       ),
        //       onPressed: () => print("ÇIKIŞ YAPILACAK...!"))
        // ],
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

class QuizTitle extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String quizid;

  QuizTitle({
    @required this.imgUrl,
    @required this.title,
    @required this.desc,
    @required this.quizid,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlayQuiz(quizid)));
      },
      child: Container(
        height: 150,
        margin: EdgeInsets.only(bottom: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6.0),
                  Text(desc,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
