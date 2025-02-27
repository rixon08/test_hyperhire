import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hyperhire/features/home/domain/models/reviewer_model.dart';

class ItemTopReviewer extends StatelessWidget {
  ReviewerModel reviewer;
  bool isTopReviewer;

  ItemTopReviewer({
    required this.reviewer,
    this.isTopReviewer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          if (isTopReviewer) SvgPicture.asset("assets/images/crown_icon.svg"),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFFFFD233),
                      width: isTopReviewer ? 4 : 0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(reviewer.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(reviewer.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
