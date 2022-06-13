class Costumer {
  int? id;
  String firstname;
  String lastname;
  String email;
  String password;
  String phone;
  String identification;

  Costumer({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.phone,
    required this.identification,
  });

  static Costumer fromMap(Map<String, dynamic> json) => Costumer(
        id: json['id'] as int?,
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        identification: json['identification'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'phone': phone,
      'identification': identification,
    };
  }
}
