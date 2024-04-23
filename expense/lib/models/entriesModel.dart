class Entry {
  final int entriesID;
  final String image;
  final String categoryName;
  final String item;
  final String amount;
  final DateTime createdAt;

  Entry({
    required this.entriesID,
    required this.image,
    required this.categoryName,
    required this.item,
    required this.amount,
    required this.createdAt
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      entriesID:int.parse( json['entriesID']?? 0) ,
      image: json['image'],
      categoryName: json['categoryName'],
      item: json['item'],
      amount: json['amount'],
      createdAt: DateTime.parse(json["createdAt"])
    );
  }
}


