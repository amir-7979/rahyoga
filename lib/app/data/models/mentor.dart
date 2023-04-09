class Mentor {
  Mentor({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.fullname,
    this.email,
    this.image,
  });
  late int? id;
  late String? username;
  late String? firstName;
  late String? lastName;
  late String? fullname;
  late String? email;
  late String? image;

  Mentor.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullname = json['fullname'];
    email = json['email'];
    image = json['image'];
  }}