class BoardGame{
  final String id;
  final String name;

//<editor-fold desc="Data Methods">
  const BoardGame({
    required this.id,
    required this.name,
  });


  @override
  String toString() {
    return 'BordGame{ id: $id, name: $name,}';
  }

  BoardGame copyWith({
    String? id,
    String? name,
  }) {
    return BoardGame(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory BoardGame.fromJson(Map<String, dynamic> json) {
    return BoardGame(
      id: json['id'] ,
      name: json['name'] ,
    );
  }

//</editor-fold>
}