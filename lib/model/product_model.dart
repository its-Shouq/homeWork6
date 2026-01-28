class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final double? rating;
  final String? thumbnail;

  ProductModel({this.id, this.title,this.description, this.price,this.rating,this.thumbnail});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      rating: json["rating"],
      thumbnail: json["thumbnail"],

    );
  }
}
