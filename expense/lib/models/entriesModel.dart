class Entry {
  final String image;
  final String categoryName;
  final String item;
  final String amount;

  Entry({
    required this.image,
    required this.categoryName,
    required this.item,
    required this.amount,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      image: json['image'],
      categoryName: json['categoryName'],
      item: json['item'],
      amount: json['amount'],
    );
  }
}


