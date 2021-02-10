import 'package:flutter/material.dart';
import 'package:intern_task/components/constants.dart';


Widget authButton(Function tap, String title) {
  return Container(
    height: 50.0,
    width: double.infinity,
    child: FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: kMainColor,
      onPressed: tap,
      child: Text(
        "$title",
        style: TextStyle(color: kWhite, fontSize: 18.0, letterSpacing: 2.0),
      ),
    ),
  );
}


Widget termsText() {
  return Column(
    children: [
      Text(
        "By clicking continue you agree to MeChat",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      RichText(
        text: TextSpan(
            text: "Terms and Conditions ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: kBlack, fontSize: 12.0),
            children: [
              TextSpan(text: "and", style: TextStyle(color: Colors.grey)),
              TextSpan(
                text: " Privacy Policy",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kBlack, fontSize: 12.0),
              ),
            ]),
      )
    ],
  );
}
