class FoodItem {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final double rating;
  final int calories;
  final String prepTime;
  final bool isPopular;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
    required this.calories,
    required this.prepTime,
    this.isPopular = false,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      calories: json['calories'],
      prepTime: json['prepTime'],
      isPopular: json['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'category': category,
        'rating': rating,
        'calories': calories,
        'prepTime': prepTime,
        'isPopular': isPopular,
      };
}
