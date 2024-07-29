class ListBooksModel {
  int? bookId;
  String? url;
  String? title;
  String? author;
  String? imageURL;
  double? rating;
  int? ratings;
  double? price;
  int? socialMediaFollowing;
  int? award;
  int? instock;
  int? catId;
  String? createdAt;
  String? updatedAt;

  ListBooksModel(
      {this.bookId,
      this.url,
      this.title,
      this.author,
      this.imageURL,
      this.rating,
      this.ratings,
      this.price,
      this.socialMediaFollowing,
      this.award,
      this.instock,
      this.catId,
      this.createdAt,
      this.updatedAt});

  ListBooksModel.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    url = json['url'];
    title = json['title'];
    author = json['author'];
    imageURL = json['ImageURL'];
    rating = json['rating'];
    ratings = json['ratings'];
    price = json['price'];
    socialMediaFollowing = json['social_media_following'];
    award = json['award'];
    instock = json['instock'];
    catId = json['cat_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['url'] = url;
    data['title'] = title;
    data['author'] = author;
    data['ImageURL'] = imageURL;
    data['rating'] = rating;
    data['ratings'] = ratings;
    data['price'] = price;
    data['social_media_following'] = socialMediaFollowing;
    data['award'] = award;
    data['instock'] = instock;
    data['cat_id'] = catId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
