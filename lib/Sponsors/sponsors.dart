import 'dart:convert';

class Sponsors {
  static List<Unit> units = [];
}

class Unit {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;

  Unit({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
  });

  Unit copyWith({
    int? id,
    String? name,
    String? desc,
    String? color,
    String? image,
  }) {
    return Unit(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'image': image,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      color: map['color'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) => Unit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Unit(id: $id, name: $name, desc: $desc, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Unit &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ desc.hashCode ^ color.hashCode ^ image.hashCode;
  }
}
