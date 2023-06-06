import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practice2/constants.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key, this.code}) : super(key: key);
  String? code;
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  Color? disabledUpIconColor = Color.fromARGB(255, 135, 135, 135);
  Color? disabledDownIconColor = Color.fromARGB(255, 135, 135, 135);
  Color? abledUpIconColor = Colors.green[400];
  Color? abledDownIconColor = Colors.red[400];
  double? safetyRating = 3;
  double? communicationRating = 3;
  double? accuracyRating = 3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(9, 10, 10, 9),
                child: const Text(
                  'Leave a review',
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "alkatra",
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ratingCard(
                          screenHeight,
                          'Safety',
                          'How safe did softwares are ?',
                          safetyRating!, (userSafetyRating) {
                        setState(() {
                          safetyRating = userSafetyRating;
                        });
                      }),
                      ratingCard(
                          screenHeight,
                          'Communication',
                          'Was there equal flow of communication',
                          communicationRating!, (userCommunicationRating) {
                        setState(() {
                          communicationRating = userCommunicationRating;
                        });
                      }),
                      ratingCard(
                          screenHeight,
                          'Accuracy',
                          'Did our softwares get your job done accurately',
                          accuracyRating!, (userAccuracyRating) {
                        setState(() {
                          accuracyRating = userAccuracyRating;
                        });
                      }),
                      recommendationCard(screenHeight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container recommendationCard(double screenHeight) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Would you recommmend the Sigma IT softwares ?',
              style: kreviewTitle),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Row(
            children: [
              IconButton(
                icon:
                    Icon(Icons.thumb_up, size: 40, color: disabledUpIconColor),
                onPressed: () {
                  setState(() {
                    disabledUpIconColor = abledUpIconColor;
                  });
                },
              ),
              const SizedBox(
                width: 65,
              ),
              IconButton(
                icon: Icon(Icons.thumb_down,
                    size: 40, color: disabledDownIconColor),
                onPressed: () {
                  setState(() {
                    disabledDownIconColor = abledDownIconColor;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
        ],
      ),
    );
  }

  Container ratingCard(double screenHeight, String title, String description,
      double rating, void Function(double) onChanged) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title, style: kreviewTitle),
          SizedBox(
            height: screenHeight * 0.003,
          ),
          Text(description, style: kreviewDescription),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          RatingBar.builder(
            itemSize: 50,
            initialRating: 3,
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                    size: 25,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
              }
            },
            onRatingUpdate: (rating) {
              onChanged(rating);
            },
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Text('Your rating: $rating', style: krating)
        ],
      ),
    );
  }
}
