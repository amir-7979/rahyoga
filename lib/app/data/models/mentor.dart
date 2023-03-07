class Mentor {
  Mentor({
    required this.id,
    required this.username,
    this.firstName,
    this.lastName,
    required this.email,
  });
  late final int id;
  late final String username;
  late final Null firstName;
  late final Null lastName;
  late final String email;

  Mentor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    firstName = null;
    lastName = null;
    email = json['email'];
  }
}
