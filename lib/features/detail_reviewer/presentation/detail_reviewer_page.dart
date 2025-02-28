import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hyperhire/features/home/domain/models/reviewer_model.dart';

class DetailReviewerPage extends StatelessWidget {
  final ReviewerModel reviewer;
  final int posReviewer;
  DetailReviewerPage({required this.posReviewer, required this.reviewer, super.key});

  List<String> listComment = ["가격 저렴해요", "CPU온도 고온", "서멀작업 가능해요", "게임 잘 돌아가요"];
  List<String> listReviews = [
    "멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.",
    "3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              '랭킹 $posReviewer위',
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Color(0xFFD7D7D7), height: 2.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _avatarReviewer(80, 80),
                      SizedBox(height: 10),
                      Text(
                        reviewer.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Visibility(
                        visible: reviewer.isTopReviewer,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/images/crown_icon.svg", width: 19, height: 19,),
                            SizedBox(width: 5),
                            Text(
                              "골드",
                              style: TextStyle(
                                color: Color(0xFFFFD233),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
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
                      SizedBox(height: 28),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(
                                color: Color(0xFF868686),
                                width: 1,
                              ),
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
                                SvgPicture.asset(
                                  "assets/images/polygon_icon.svg",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    _divider(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 125,
                            height: 125,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFCECECE),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
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
                                    SvgPicture.asset(
                                      "assets/images/rating_4.svg",
                                    ),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 16,
                      ),
                      child: _divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _avatarReviewer(40, 40),
                              SizedBox(width: 6),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reviewer.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/rating_4.svg",
                                        height: 11,
                                      ),
                                      Text(
                                        "2022.12.09",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0xFF868686),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset("assets/images/saved_icon.svg"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (int i = 0; i < listComment.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                "\"${listComment[i]}\"",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFA0A0A0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < listReviews.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: SvgPicture.asset(
                                      "assets/images/lightning_${i == 0 ? "1" : "2"}_icon.svg",
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      listReviews[i],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF616161),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
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
          ),
          _divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: SvgPicture.asset("assets/images/comment_icon.svg"),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 10.0,
                  minHeight: 10.0,
                ),
                hintText: "댓글 달기..",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(color: Colors.grey, width: double.infinity, height: 0.5);
  }

  Widget _avatarReviewer(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(reviewer.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
