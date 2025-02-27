import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hyperhire/features/home/domain/models/reviewer_model.dart';

class DetailReviewerPage extends StatelessWidget {
  final ReviewerModel reviewer;
  DetailReviewerPage({required this.reviewer, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              '랭킹 1위',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF868686),
              ),
            ),
            Text(
              '베스트 리뷰어',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1D1D1D),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
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
                    image: DecorationImage(
                      image: AssetImage(reviewer.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  reviewer.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/crown_icon.svg"),
                    SizedBox(width: 5),
                    Text(
                      "골드",
                      style: TextStyle(
                        color: Color(0xFFFFD233),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFF0F0F0),
                  ),
                  child: Text(
                    "조립컴 업체를 운영하며 리뷰를 작성합니다.",
                    style: TextStyle(color: Color(0xFF868686)),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(height: 30, color: Color(0xFFEEEEEE)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "작성한 리뷰",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "  총 35개",
                            style: TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Color(0xFF868686), width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "최신순",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF868686),
                            ),
                          ),
                          SizedBox(width: 25),
                          SvgPicture.asset("assets/images/polygon_icon.svg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(color: Colors.grey, width: double.infinity, height: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 125,
                      height: 125,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFCECECE), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/amd.png",
                          width: 110,
                          height: 110,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "AMD 라이젠 5 5600X 버미어 정품 멀티팩",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset("assets/images/rating_4.svg"),
                              Text(
                                "4.07",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
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
