class AuthResponse {
  AuthResponse({
    required this.message,
    this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] as String,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'] as String,
    );
  }

  final String message;
  final User? user;
  final String token;

  AuthResponse copyWith({
    String? message,
    User? user,
    String? token,
  }) {
    return AuthResponse(
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'message': message,
      'token': token,
    };
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }
}

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
    return {
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
