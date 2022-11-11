// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usuario {

  // ignore: non_constant_identifier_names
  final String UID;
  final String email;


  Usuario(
    this.UID,
    this.email,
  );
  // ignore: non_constant_identifier_names




  Usuario copyWith({
    // ignore: non_constant_identifier_names
    String? UID,
    String? email,
  }) {
    return Usuario(
      UID ?? this.UID,
      email ?? this.email,

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UID': UID,
      'email': email,

    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      map['UID'] as String,
      map['email'] as String,

    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Usuario(UID: $UID, email: $email)';

  @override
  bool operator ==(covariant Usuario other) {
    if (identical(this, other)) return true;
  
    return 
      other.UID == UID &&
      other.email == email;
  }

  @override
  int get hashCode => UID.hashCode ^ email.hashCode;
}
