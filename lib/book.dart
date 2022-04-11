class Book {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String date;
  bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.date,
    this.isFavorite = false,
  });
}
