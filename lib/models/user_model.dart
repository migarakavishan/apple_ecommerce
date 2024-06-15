class UserModel {
  String name;
  String email;
  String uid;
  String image;
  List<String>? favorite;

  UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      this.favorite,
      this.image = 'https://cdn-icons-png.flaticon.com/512/6188/6188625.png'});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        uid: json['uid'],
        favorite: json['favorite'] == null
            ? null
            : (json['favorite'] as List<String>),
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'image': image,
      'favorite': favorite
    };
  }
}
