class FavoriteProductDatabaseModel {
  final int uid;
  final int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int ratingCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FavoriteProductDatabaseModel({
    required this.uid,
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
    this.createdAt,
    this.updatedAt,
  });

  factory FavoriteProductDatabaseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductDatabaseModel(
        uid: json['uid'],
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: json['rate'],
        ratingCount: json['count'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rate': rating,
        'count': ratingCount,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
