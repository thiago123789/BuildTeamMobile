class Client {
  final String id;
  final String name;
  final String country;
  final String marketType;
  final String logo;

  Client({this.id, this.name, this.country, this.marketType, this.logo});

  factory Client.fromJson(Map<String, dynamic> json, String id) {
    return Client(
        id: id,
        name: json['name'],
        country: json['country'],
        marketType: json['marketType'],
        logo: json['logo']);
  }
}
