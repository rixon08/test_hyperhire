import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hyperhire/features/home/domain/models/item_model.dart';
import 'package:test_hyperhire/features/home/enums/type_crown_item.dart';

class ItemTopWidget extends StatelessWidget {
  ItemModel item;

  ItemTopWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    String crownUrl = "";
    if (item.crown == TypeCrownItem.one) {
      crownUrl = "assets/images/crown_1.svg";
    } else if (item.crown == TypeCrownItem.two) {
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
                Center(child: Image.asset(item.image, width: 110, height: 110)),
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
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                for (int i = 0; i < item.listDesc.length; i++)
                  Text(
                    "• ${item.listDesc[i]}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/rating_icon.svg"),
                    SizedBox(width: 5),
                    Text(
                      item.rating,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFD233),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(${item.ratingCount})",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    for (int i = 0; i < item.listTag.length; i++)
                      i > 0
                          ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 6),
                              _itemTag(item.listTag[i]),
                            ],
                          )
                          : _itemTag(item.listTag[i]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemTag(String tag) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(5),
      child: Text(tag, style: TextStyle(color: Color(0xFF868686))),
    );
  }
}
