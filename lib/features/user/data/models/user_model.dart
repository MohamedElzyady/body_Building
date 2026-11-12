class UserModel {
  final String name;
  final int age;
  final double height;
  final double weight;
  final String goal;

  const UserModel({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.goal,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      goal: json['goal'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'goal': goal,
    };
  }

  UserModel copyWith({
    String? name,
    int? age,
    double? height,
    double? weight,
    String? goal,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      goal: goal ?? this.goal,
    );
  }
}
