class ReviewerModel {
  String name;
  String imageUrl;
  bool isTopReviewer;

  ReviewerModel({
    required this.name,
    required this.imageUrl,
    this.isTopReviewer = false,
  });
}