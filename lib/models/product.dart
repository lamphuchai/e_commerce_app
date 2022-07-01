import 'dart:convert';

class Product {
  final String title;
  final int price;
  final String brandName;
  final int rating;
  final String image;
  final int numberRating;
  final String tag;
  final int? priceSale;
  final String typeProduct;
  Product({
    required this.title,
    required this.price,
    required this.brandName,
    required this.rating,
    required this.image,
    required this.numberRating,
    required this.tag,
    this.priceSale,
    required this.typeProduct,
  });

  Product copyWith({
    String? title,
    int? price,
    String? brandName,
    int? rating,
    String? image,
    int? numberRating,
    String? tag,
    int? priceSale,
    String? typeProduct,
  }) {
    return Product(
      title: title ?? this.title,
      price: price ?? this.price,
      brandName: brandName ?? this.brandName,
      rating: rating ?? this.rating,
      image: image ?? this.image,
      numberRating: numberRating ?? this.numberRating,
      tag: tag ?? this.tag,
      priceSale: priceSale ?? this.priceSale,
      typeProduct: typeProduct ?? this.typeProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'brandName': brandName,
      'rating': rating,
      'image': image,
      'numberRating': numberRating,
      'tag': tag,
      'priceSale': priceSale,
      'typeProduct': typeProduct,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] ?? '',
      price: map['price']?.toInt() ?? 0,
      brandName: map['brandName'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      image: map['image'] ?? '',
      numberRating: map['numberRating']?.toInt() ?? 0,
      tag: map['tag'] ?? '',
      priceSale: map['priceSale']?.toInt(),
      typeProduct: map['typeProduct'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(title: $title, price: $price, brandName: $brandName, rating: $rating, image: $image, numberRating: $numberRating, tag: $tag, priceSale: $priceSale, typeProduct: $typeProduct)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.title == title &&
      other.price == price &&
      other.brandName == brandName &&
      other.rating == rating &&
      other.image == image &&
      other.numberRating == numberRating &&
      other.tag == tag &&
      other.priceSale == priceSale &&
      other.typeProduct == typeProduct;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      price.hashCode ^
      brandName.hashCode ^
      rating.hashCode ^
      image.hashCode ^
      numberRating.hashCode ^
      tag.hashCode ^
      priceSale.hashCode ^
      typeProduct.hashCode;
  }
}
