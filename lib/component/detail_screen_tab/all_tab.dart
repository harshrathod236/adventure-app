import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreenAllTab extends StatelessWidget {
  const DetailScreenAllTab({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: size.width * 0.050,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            "The word Kerala is first recorded as Keralaputo ('son of Chera [s]') in a 3rd-century-BCE rock inscription left by the Maurya emperor Ashoka (274–237 BCE), one of his edicts pertaining to welfare.[24] At that time, one of three states in the region was called Cheralam in Classical Tamil: Chera and Kera are variants of the same word.[25] The word Cheral refers to the oldest known dynasty of Kerala kings and is derived from the Proto-Tamil-Malayalam word for 'lake'.[26] Keralam may stem from the Classical Tamil cherive-alam 'declivity of a hill or a mountain slope'[27] or chera alam 'land of the Cheras', The word Kerala is first recorded as Keralaputo ('son of Chera [s]') in a 3rd-century-BCE rock inscription left by the Maurya emperor Ashoka (274–237 BCE), one of his edicts pertaining to welfare.[24] At that time, one of three states in the region was called Cheralam in Classical Tamil: Chera and Kera are variants of the same word.[25] The word Cheral refers to the oldest known dynasty of Kerala kings and is derived from the Proto-Tamil-Malayalam word for 'lake'.[26] Keralam may stem from the Classical Tamil cherive-alam 'declivity of a hill or a mountain slope'[27] or chera alam 'land of the Cheras'.",
            trimLines: 14,
            style: TextStyle(fontSize: size.width * 0.040),
            colorClickableText: Colors.orange,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
          ),
        ],
      ),
    );
  }
}
