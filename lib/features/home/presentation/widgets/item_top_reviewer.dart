import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hyperhire/features/detail_reviewer/presentation/detail_reviewer_page.dart';
import 'package:test_hyperhire/features/home/domain/models/reviewer_model.dart';

class ItemTopReviewer extends StatelessWidget {
  ReviewerModel reviewer;
  int posReviewer;

  ItemTopReviewer({
    required this.posReviewer,
    required this.reviewer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailReviewerPage(posReviewer: posReviewer, reviewer: reviewer),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              if (reviewer.isTopReviewer)
                SvgPicture.asset("assets/images/crown_icon.svg"),
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
                          width: reviewer.isTopReviewer ? 4 : 0,
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
        ),
      ),
    );
  }
}
