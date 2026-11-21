class Game {
  const Game({this.id, required this.title, required this.platform, required this.price,});

  final int? id;
  final String title;
  final String platform;
  final double price;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'platform': platform,
      'price': price,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as int,
      title: map['title'] as String,
      platform: map['platform'] as String,
      price: (map['price'] as num).toDouble(),
    );
  }
}