import 'package:test_hyperhire/features/home/enums/type_crown_item.dart';

class ItemModel {
  final String name;
  final List<String> listDesc;
  final TypeCrownItem crown;
  final String image;
  final String rating;
  final String ratingCount;
  final List<String> listTag;

  ItemModel({
    required this.name,
    required this.listDesc,
    required this.crown,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.listTag
  });
}