class Fitur {
  final String id;
  final String title;
  final String description;
  final String route;
  
  Fitur({
    this.id,
    this.title,
    this.description,
    this.route,
  });

  factory Fitur.fromJson(Map<String, dynamic> json) {
    return Fitur(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      route: json['route'],
    );
  }
}