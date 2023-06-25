class Suggestion{
  /*final String activity;
  final String type;*/
  final String name;
  final String address;

  Suggestion({required this.name, required this.address/*required this.activity, required this.type*/});

  factory Suggestion.fromJson(List<Map<String, dynamic>> json) {
    return Suggestion(
      /*activity: json['activity'],
      type: json['type'],*/
      name: json[0]['name'],
      address: json[0]['address'],

    );
  }
}