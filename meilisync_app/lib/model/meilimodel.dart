class MeiliSearch {
  final List<Item> items;

  MeiliSearch({
    required this.items,
  });
  factory MeiliSearch.fromJson(Map<String, dynamic> json) => MeiliSearch(
        items:
            List<Item>.from(json['items'].map((item) => Item.fromJson(item))),
      );
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class Item {
  final String id;
  final String label;
  final String apiKey;
  final String url;

  Item({
    required this.id,
    required this.label,
    required this.apiKey,
    required this.url,
  });

  // Factory constructor to create an instance from a JSON object
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      label: json['label'],
      apiKey: json['apiKey'],
      url: json['url'],
    );
  }

  // Method to convert the object back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'apiKey': apiKey,
      'url': url,
    };
  }
}
