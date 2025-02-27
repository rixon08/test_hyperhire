import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hyperhire/features/home/enums/type_crown_item.dart';

class ItemTopWidget extends StatelessWidget {
  String name;
  String desc1;
  String desc2;
  TypeCrownItem crown;
  String image;
  String rating;
  String ratingCount;
  String tag1;
  String tag2;

  ItemTopWidget({
    required this.name,
    required this.desc1,
    required this.desc2,
    required this.crown,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.tag1,
    required this.tag2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String crownUrl = "";
    if (crown == TypeCrownItem.one) {
      crownUrl = "assets/images/crown_1.svg";
    } else if (crown == TypeCrownItem.two) {
      crownUrl = "assets/images/crown_2.svg";
    } else {
      crownUrl = "assets/images/crown_3.svg";
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
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
            child: Stack(
              children: [
                Center(child: Image.asset(image, width: 110, height: 110,)),
                SvgPicture.asset(crownUrl, width: 19),
              ],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  "• ${desc1}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  "• ${desc2}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/rating_icon.svg"),
                    SizedBox(width: 5,),
                    Text(rating, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFFFD233)),),
                    SizedBox(width: 5,),
                    Text("(${ratingCount})", style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFC4C4C4)),)
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    _itemTag(tag1),
                    SizedBox(width: 6,),
                    _itemTag(tag2),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemTag(String tag){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      padding: EdgeInsets.all(5),
      child: Text(tag, style: TextStyle(color: Color(0xFF868686)),),
    );
  }
}
