import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomAlert extends StatefulWidget {
  const CustomAlert({Key? key}) : super(key: key);

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Rating Our App',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RatingBar(
                minRating: 0,
                initialRating: 0,
                itemSize: 30,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
                ratingWidget: RatingWidget(
                  empty: const Icon(
                    Icons.star_border,
                    color: Colors.orange,
                  ),
                  full: const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  '$_rating %',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Submit'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
      ],
    );
  }
}
