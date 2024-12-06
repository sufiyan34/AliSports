class UserReviews {
  String? image;
  String? name;
  String? item;
  String? email;
  String? review;
  double rating = 0;
  UserReviews({
    this.image,
    this.name,
    this.item,
    this.review,
    this.rating = 0,
    this.email,
  });
}
