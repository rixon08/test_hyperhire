import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_hyperhire/features/home/domain/models/reviewer_model.dart';
import 'package:test_hyperhire/features/home/enums/type_crown_item.dart';
import 'package:test_hyperhire/features/home/presentation/widgets/item_top_reviewer.dart';
import 'package:test_hyperhire/features/home/presentation/widgets/item_top_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
    'assets/images/image_3.png',
    'assets/images/image_4.png',
  ];

  final List<ReviewerModel> reviewers = [
    ReviewerModel(
      name: "Name01",
      imageUrl: 'assets/images/reviewer/1.jpeg',
      isTopReviewer: true,
    ),
    ReviewerModel(name: "Name02", imageUrl: 'assets/images/reviewer/2.jpeg'),
    ReviewerModel(name: "Name03", imageUrl: 'assets/images/reviewer/3.jpeg'),
    ReviewerModel(name: "Name04", imageUrl: 'assets/images/reviewer/4.jpeg'),
    ReviewerModel(name: "Name05", imageUrl: 'assets/images/reviewer/5.jpeg'),
    ReviewerModel(name: "Name06", imageUrl: 'assets/images/reviewer/6.jpeg'),
    ReviewerModel(name: "Name07", imageUrl: 'assets/images/reviewer/7.jpeg'),
    ReviewerModel(name: "Name08", imageUrl: 'assets/images/reviewer/8.jpeg'),
    ReviewerModel(name: "Name09", imageUrl: 'assets/images/reviewer/9.jpeg'),
    ReviewerModel(name: "Name10", imageUrl: 'assets/images/reviewer/10.jpeg'),
  ];

  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text('LOGO'),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Color(0xFFD7D7D7), height: 2.0),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 3, color: Colors.transparent),
                  ),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [Color(0xFF74FBDE), Color(0xFF3C41BF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ), // Dummy Border
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: SvgPicture.asset(
                            "assets/search_icon.svg",
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minWidth: 25.0,
                            minHeight: 25.0,
                          ),
                          hintText: "검색어를 입력하세요",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      carouselController: _controller,
                      items:
                          images.map((path) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                      options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 8),
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: images.length,
                        effect: ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          activeDotColor: Colors.white,
                          dotColor: Colors.white,
                          expansionFactor:
                              2.0, // Membuat indikator lonjong saat aktif
                        ),
                        onDotClicked: (index) {
                          _controller.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "제일 핫한 리뷰를 만나보세요",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF616161),
                                  ),
                                ),
                                Text(
                                  "리뷰️  랭킹⭐ top 3",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ItemTopWidget(
                            name: "LG전자 스탠바이미 27ART10AKPL (스탠",
                            desc1:
                                "화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다.",
                            desc2: "스탠바이미는 사랑입니다!️",
                            crown: TypeCrownItem.one,
                            image: "assets/images/tv_1.png",
                            rating: "4.89",
                            ratingCount: "256",
                            tag1: "LG전자",
                            tag2: "편리성",
                          ),
                          ItemTopWidget(
                            name: "LG전자  울트라HD 75UP8300KNA (스탠드)",
                            desc1: "화면 잘 나오고... 리모컨 기능 좋습니다.",
                            desc2:
                                "넷플 아마존 등 버튼하나로 바로 접속 되고디스플레이는 액정문제 없어보이고소리는 살짝 약간 감이 있으나 ^^; 시끄러울까봐 그냥 블루투스 헤드폰 구매 예정이라 문제는 없네요. 아주 만족입니다!!",
                            crown: TypeCrownItem.two,
                            image: "assets/images/tv_2.png",
                            rating: "4.36",
                            ratingCount: "136",
                            tag1: "LG전자",
                            tag2: "고화질",
                          ),
                          ItemTopWidget(
                            name:
                                "라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)",
                            desc1:
                                "반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면 차고 넘칠만 합니다",
                            desc2:
                                "중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어OTT 서비스에 오픈 브라우저 까지 너무 마음에 들게끔 기능들을 사용 가능했고",
                            crown: TypeCrownItem.three,
                            image: "assets/images/tv_3.png",
                            rating: "3.98",
                            ratingCount: "98",
                            tag1: "라익미",
                            tag2: "가성비",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 30, color: Color(0xFFEEEEEE)),
                _bestReviewerWidget(),
                Container(
                  padding: EdgeInsets.all(16),
                  color: Color(0xFFEEEEEE),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGO Inc.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF868686),
                        ),
                      ),
                      _spacing(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "회사 소개 ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868686),
                                ),
                              ),
                            ),
                          ),
                          _divider(),
                          Expanded(
                            child: Center(
                              child: Text(
                                "인재 채용",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868686),
                                ),
                              ),
                            ),
                          ),
                          _divider(),
                          Expanded(
                            child: Center(
                              child: Text(
                                "기술 블로그",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868686),
                                ),
                              ),
                            ),
                          ),
                          _divider(),
                          Expanded(
                            child: Center(
                              child: Text(
                                "리뷰 저작권",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868686),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _spacing(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset("assets/images/arrow_icon.svg"),
                              Text(
                                "review@logo.com",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868686),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
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
                                  "KOR",
                                  style: TextStyle(
                                    fontSize: 10,
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
                      _spacing(),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color(0xFFC8C8C8),
                      ),
                      _spacing(),
                      Text(
                        "@2022-2022 LOGO Lab, Inc. (주)아무개  서울시 강남구",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868686),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          border: Border(top: BorderSide(color: Color(0xFFD7D7D7), width: 2)),
          // boxShadow: [
          //   BoxShadow(color: Colors.grey.shade300, spreadRadius: 0, blurRadius: 22),
          // ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF1D1D1D),
            unselectedItemColor: Color(0xFFD7D7D7),
            selectedLabelStyle: TextStyle(color: Color(0xFF1D1D1D)),
            unselectedLabelStyle: TextStyle(color: Color(0xFFD7D7D7)),
            currentIndex: 0,
            onTap: (index) {},
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/home_icon.svg"),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/category_icon.svg"),
                label: '카테고리',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/community_icon.svg"),
                label: '커뮤니티',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/my_page_icon.svg"),
                label: '마이페이지',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacing() {
    return SizedBox(height: 14);
  }

  Widget _divider() {
    return Container(height: 15, width: 2, color: Color(0xFFC8C8C8));
  }

  Widget _bestReviewerWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "골드 계급 사용자들이예요",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF616161),
                ),
              ),
              Text(
                "베스트 리뷰어 🏆 Top10",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < reviewers.length; i++)
                ItemTopReviewer(reviewer: reviewers[i]),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
