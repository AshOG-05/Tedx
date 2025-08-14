import 'dart:convert';

class Sponsors {
  static List<SponsorObject> objects = [

  ];
}

class SponsorObject {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;

  SponsorObject({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
  });

  SponsorObject copyWith({
    int? id,
    String? name,
    String? desc,
    String? color,
    String? image,
  }) {
    return SponsorObject(
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

  factory SponsorObject.fromMap(Map<String, dynamic> map) {
    return SponsorObject(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      color: map['color'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorObject.fromJson(String source) => SponsorObject.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorObject(id: $id, name: $name, desc: $desc, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SponsorObject &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
