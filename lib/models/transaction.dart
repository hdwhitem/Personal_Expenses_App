class Transaction {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.date,
  });
}
