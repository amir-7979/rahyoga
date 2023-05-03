class Profile {
  Profile({
    this.id,
    this.lastLogin,
    this.username,
    this.firstName,
    this.lastName,
    this.nickname,
    this.bio,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.image,
    this.email,
    this.phoneNumber,
    this.address,
    this.postalCode,
    this.isSuperuser,
    this.isStaff,
    this.isActive,
    this.isVolunteer,
    this.watched,
    this.courses,
    this.progress,
  });

  late  int? id;
  late final String? lastLogin;
  late final String? username;
  late final String? firstName;
  late final String? lastName;
  late final String? nickname;
  late final String? bio;
  late final String? gender;
  late final String? height;
  late final String? weight;
  late final String? age;
  late final String? image;
  late final String? email;
  late final String? phoneNumber;
  late final String? address;
  late final String? postalCode;
  late final bool? isSuperuser;
  late final bool? isStaff;
  late final bool? isActive;
  late final bool? isVolunteer;
  late final int? watched;
  late final int? courses;
  late  double? progress;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastLogin = json['last_login'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nickname = json['nickname'];
    bio = json['bio'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    image = json['image'];
    email = json['email'];
    phoneNumber = json['phone_number'] == null ? null : '0${json['phone_number'].substring(3)}';
    address = json['address'];
    postalCode = json['postal_code'];
    isSuperuser = json['is_superuser'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    isVolunteer = json['is_volunteer'];
    watched = json['watched'];
    courses = json['courses'];
    progress = json['progress']??0;
  }
}
