import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreenReviewTab extends StatefulWidget {
  const DetailScreenReviewTab({Key? key}) : super(key: key);

  @override
  State<DetailScreenReviewTab> createState() => _DetailScreenReviewTabState();
}

class _DetailScreenReviewTabState extends State<DetailScreenReviewTab> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "By Henry Ford",
                          style: TextStyle(color: Colors.grey, fontSize: size.width * 0.040, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            top: size.height * 0.001,
                          ),
                          child: Text(
                            "27 Aug 2022",
                            style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            '$_rating',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: RatingBar(
                            minRating: 2.5,

                            initialRating: 0,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        "Most relaxing holiday we have ever had. We definitely didn’t want to leave and would absolutely return to the same resort,",
                        softWrap: true,
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "By Henry Ford",
                          style: TextStyle(color: Colors.grey, fontSize: size.width * 0.040, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            top: size.height * 0.001,
                          ),
                          child: Text(
                            "27 Aug 2022",
                            style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            '$_rating',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: RatingBar(
                            minRating: 2.5,

                            initialRating: 0,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        "Most relaxing holiday we have ever had. We definitely didn’t want to leave and would absolutely return to the same resort,",
                        softWrap: true,
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "By Henry Ford",
                          style: TextStyle(color: Colors.grey, fontSize: size.width * 0.040, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            top: size.height * 0.001,
                          ),
                          child: Text(
                            "27 Aug 2022",
                            style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            '$_rating',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: RatingBar(
                            minRating: 2.5,

                            initialRating: 0,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        "Most relaxing holiday we have ever had. We definitely didn’t want to leave and would absolutely return to the same resort,",
                        softWrap: true,
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "By Henry Ford",
                          style: TextStyle(color: Colors.grey, fontSize: size.width * 0.040, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            top: size.height * 0.001,
                          ),
                          child: Text(
                            "27 Aug 2022",
                            style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            '$_rating',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: RatingBar(
                            minRating: 2.5,

                            initialRating: 0,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        "Most relaxing holiday we have ever had. We definitely didn’t want to leave and would absolutely return to the same resort,",
                        softWrap: true,
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "By Henry Ford",
                          style: TextStyle(color: Colors.grey, fontSize: size.width * 0.040, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            top: size.height * 0.001,
                          ),
                          child: Text(
                            "27 Aug 2022",
                            style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            '$_rating',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: RatingBar(
                            minRating: 2.5,

                            initialRating: 0,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        "Most relaxing holiday we have ever had. We definitely didn’t want to leave and would absolutely return to the same resort,",
                        softWrap: true,
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, fontSize: size.width * 0.030, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
