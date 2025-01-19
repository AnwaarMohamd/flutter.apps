class SourcePage {
  final List<Itemsource> items;

  SourcePage({
    required this.items,
  });
  factory SourcePage.fromJson(Map<String, dynamic> json) => SourcePage(
        items: List<Itemsource>.from(
            json['items'].map((item) => Itemsource.fromJson(item))),
      );
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class Itemsource {
  final String id;
  final String label;
  final String database;
  final String url;
  // final int type;

  Itemsource({
    required this.id,
    required this.label,
    required this.database,
    required this.url,
    // required this.type,
  });

  // Factory constructor to create an instance from a JSON object
  factory Itemsource.fromJson(Map<String, dynamic> json) {
    return Itemsource(
      id: json['id'],
      label: json['label'],
      database: json['database'],
      url: json['url'],
      // type: json['type'],
    );
  }

  // Method to convert the object back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'database': database,
      'url': url,
      // 'type': type,
    };
  }
}
