import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.user,
        this.token,
    });

    User user;
    Token token;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "token": token == null ? null : token.toJson(),
    };
}

class Token {
    Token({
        this.accessToken,
        this.refreshToken,
    });

    String accessToken;
    String refreshToken;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        refreshToken: json["refreshToken"] == null ? null : json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
        "refreshToken": refreshToken == null ? null : refreshToken,
    };
}

class User {
    User({
        this.roleId,
        this.userId,
        this.id,
    });

    String roleId;
    String userId;
    String id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        roleId: json["roleId"] == null ? null : json["roleId"],
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "roleId": roleId == null ? null : roleId,
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
    };
}
