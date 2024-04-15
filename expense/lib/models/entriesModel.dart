class Categori {
  var image;
  var categoryName;
  var item;
  var amount;

  Categori({required this.image, required this.categoryName, required this.item,required this.amount});

  factory Categori.fromJson(Map<String, dynamic> json) {
    return Categori(image: json['image'], categoryName: json['category'], item: json['item'],amount: json['amount']);
  }
}