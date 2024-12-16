/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutt@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDZhZWYxZDU5NjA0YTlhMWJhZjU1NSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM0MTg3NTMzLCJleHAiOjE3NDE5NjM1MzN9.JAit03iFYUEk5Ggb2_jw5pkwfxBDskJ1_W3F0GukrkE"

class AuthResponse {
  AuthResponse(
      {required this.message,
      this.user,
      required this.token,
      required this.statusMessage});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] as String,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'] as String,
      statusMessage: json['statusMsg'],
    );
  }

  final String message;
  final User? user;
  final String token;
  final String statusMessage;

  AuthResponse copyWith({
    String? message,
    User? user,
    String? token,
  }) {
    return AuthResponse(
        message: message ?? this.message,
        user: user ?? this.user,
        token: token ?? this.token,
        statusMessage: statusMessage);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutt@gmail.com"
/// role : "user"

class User {
  User({
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  final String name;
  final String email;
  final String role;

  User copyWith({
    String? name,
    String? email,
    String? role,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
