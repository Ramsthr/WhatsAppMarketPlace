class Group {
  final String name;
  bool hasMarketplace;
  bool isAdmin;

  Group(
      {required this.name, this.hasMarketplace = false, this.isAdmin = false});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'],
      hasMarketplace: json['hasMarketplace'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'hasMarketplace': hasMarketplace,
    };
  }
}
