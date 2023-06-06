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
  Color? disabledUpIconColor = const Color.fromARGB(255, 135, 135, 135);
  Color? disabledDownIconColor = const Color.fromARGB(255, 135, 135, 135);
  Color? abledUpIconColor = Colors.green[400];
  Color? abledDownIconColor = Colors.red[400];
  double? safetyRating = 3;
  double? communicationRating = 3;
  double? accuracyRating = 3;
  String? selectedValue;

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
                padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Leave a review',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: "alkatra",
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ratingCard(
                          screenHeight,
                          'Rate Us',
                          'How much are you satsfied',
                          safetyRating!, (userSafetyRating) {
                        setState(() {
                          safetyRating = userSafetyRating;
                        });
                      }),
                      // ratingCard(
                      //     screenHeight,
                      //     'Communication',
                      //     'Was there equal flow of communication',
                      //     communicationRating!, (userCommunicationRating) {
                      //   setState(() {
                      //     communicationRating = userCommunicationRating;
                      //   });
                      // }),
                      // ratingCard(
                      //     screenHeight,
                      //     'Accuracy',
                      //     'Did our softwares get your job done accurately',
                      //     accuracyRating!, (userAccuracyRating) {
                      //   setState(() {
                      //     accuracyRating = userAccuracyRating;
                      //   });
                      // }),
                      recommendationCard(screenHeight),
                      textFeildCard(screenHeight),
                      submitReviewButton(screenWidth),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container textFeildCard(double screenHeight) {
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
        children: [
          const Text('Care to share more about it ?',
              style: kreviewDescription),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          SizedBox(
            height: 200, //TextField expands to this height.
            child: TextField(
              onChanged: (value) {},
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'write here...'),
            ),
          ),
        ],
      ),
    );
  }

  InkWell submitReviewButton(double screenWidth) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Color.fromARGB(0, 209, 207, 207),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: ((context) => )));
      },
      child: Container(
        height: screenWidth / 8,
        width: screenWidth * 0.4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 75, 170, 218),
                Color.fromARGB(255, 0, 61, 90),
              ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          "SUBMIT REVIEW",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
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
          const Text('Select one option', style: kreviewTitle),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                title: const Text("1"),
                value: "1",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("2"),
                value: "2",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("3"),
                value: "3",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              )
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
