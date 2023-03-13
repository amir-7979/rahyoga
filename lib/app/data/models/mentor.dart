class Mentor {
  Mentor({
     this.id,
     this.username,
     this.firstName,
     this.lastName,
     this.fullname,
     this.email,
  });

  late final int? id;
  late final String? username;
  late final String? firstName;
  late final String? lastName;
  late final String? fullname;
  late final String? email;

  Mentor.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullname = json['fullname'];
    email = json['email'];
  }
}
