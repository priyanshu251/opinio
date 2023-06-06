import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key, this.code}) : super(key: key);
  String? code;
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ratingCard(
                    screenHeight, 'Safety', 'how safe did softwares are?'),
                ratingCard(screenHeight, 'Communication',
                    'was there equal flow of communication'),
                ratingCard(screenHeight, 'Accuracy',
                    'did our softwares get your job done')
              ],
            ),
          ),
        ));
  }

  Container ratingCard(double screenHeight, String title, String description) {
    return Container(
      height: screenHeight * (1 / 4),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xffDDDDDD),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title),
          Text(description),
          const Icon(Icons.star),
        ],
      ),
    );
  }
}
