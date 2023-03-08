class User {
  String? token;
  String? username;

  User({
    this.token,
    this.username,
  });
  User.fromJson(Map<String, dynamic> json) {
    token = json['token']?.toString();
    username = json['username']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;

    return data;
  }
}
