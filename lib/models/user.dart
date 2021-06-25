class User {
  String? name;
  String? lastName;
  int? age;

  User({
    this.name,
    this.lastName,
    this.age,
  });

  @override
  int get hashCode => name.hashCode ^ lastName.hashCode ^ age.hashCode;

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      (other is User) &&
          this.name == other.name &&
          this.lastName == other.lastName &&
          this.age == other.age;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastName: json['lastName'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastName': lastName,
        'age': age,
      };
}
