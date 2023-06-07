import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practice2/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key, this.code}) : super(key: key);
  String? code;
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  Color? disabledUpIconColor = const Color.fromARGB(255, 135, 135, 135);
  Color? disabledDownIconColor = const Color.fromARGB(255, 135, 135, 135);
  double? safetyRating = 3;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF68A4C3),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Leave a review',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: "alkatra",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ratingCard(screenHeight, 'Rate Us', safetyRating!,
                      (userSafetyRating) {
                    setState(() {
                      safetyRating = userSafetyRating;
                    });
                  }),
                  recommendationCard(screenHeight),
                  textFeildCard(screenHeight),
                  Center(child: submitReviewButton(screenWidth)),
                ],
              ),
            ),
          ),
        ));
  }

  Container textFeildCard(double screenHeight) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: kCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tell us how can we improve', style: kreviewTitle),
          SizedBox(
            height: screenHeight * 0.001,
          ),
          SizedBox(
            height: 160, //TextField expands to this height.
            child: TextField(
              onChanged: (value) {},
              style: krating,
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

  Widget submitReviewButton(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: const Color.fromARGB(0, 209, 207, 207),
        onTap: () {
          Alert(
            style: const AlertStyle(
              backgroundColor: Color(0xFFEDD3D3),
              animationType: AnimationType.fromBottom,
              isCloseButton: false,
              descStyle: TextStyle(
                  fontFamily: 'alkatra',
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            context: context,
            desc: "Your feedback is submitted",
            image: Image.asset("images/feedback1.png"),
            buttons: [
              DialogButton(
                child: const Text(
                  "BACK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: const Color(0xFF68A4C3),
                radius: BorderRadius.circular(8.0),
              ),
            ],
          ).show();
        },
        child: Container(
          height: screenWidth / 8,
          width: screenWidth * 0.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: kButtonGradient,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            "SUBMIT REVIEW",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Container recommendationCard(double screenHeight) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: kCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Select one option', style: kreviewTitle),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("1", style: krating),
                value: "1",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("2", style: krating),
                value: "2",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("3", style: krating),
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
        ],
      ),
    );
  }

  Container ratingCard(double screenHeight, String title, double rating,
      void Function(double) onChanged) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: kCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title, style: kreviewTitle),
          SizedBox(
            height: screenHeight * 0.003,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 50,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
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
// onRatingUpdate: (rating) {
//               onChanged(rating);