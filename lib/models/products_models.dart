class ProductModel1 {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int rateCount;

  const ProductModel1({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.rateCount,
  });

  factory ProductModel1.fromJson(Map<String, dynamic> json) {
    var price = json["price"].toString();
    var rate = json['rating']['rate'].toString();

    return ProductModel1(
      id: json['id'],
      title: json['title'],
      price: double.parse(price),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: double.parse(rate),
      rateCount: json['rating']['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
      'rateCount': rateCount,
    };
  }
}

class Rating {
  final double rate;
  final int count;

  const Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    var finalRate = json['rate'].toString();
    return Rating(
      rate: double.parse(finalRate),
      count: json['count'],
    );
  }
}
