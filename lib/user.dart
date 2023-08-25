import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';
class User{
  final String name;
  final String email;
 User({
    required this.name,
   required this.email,
});

  User copyWith({ String? name,
    String? email,

  }) {
    return User(
      name:name ?? this.name,
    email:email?? this.email,
    );
  }
  Map<String , dynamic> toMap()
  {
    return {
      name:name ?? this.name,
      email:email?? this.email,
    };
  }

  factory User.fromMap(Map<String,dynamic> map){
    return User(
      name:map['name'] ?? '',
      email:map['name'] ?? '',
    );
  }
String toJson()=>json.encode(toMap());
  factory User.fromJson(String source)=>User.fromMap(json.decode(source));
}

//this will contain all methods to updATE DATA
// class UserNotifier extends StateNotifier<User>{
//   UserNotifier()
//   :super(
//     User(name:'',age:0),
//   ){
//     updateName('aaaa');
//   }
// //func to update data
//
// void updateName(String n)
// {
//   state=state.copyWith(name:n);
// }
//   void updateAge(int a)
//   {
//     state=state.copyWith(age:a);
//   }
//   }
//
//   class UserNotifierChange extends ChangeNotifier {
//   User user= User(name:'',age:0);
//
//   void updateName(String n)
//   {
//     user=user.copyWith(name:n);
//     notifyListeners();//it will notify all clients for eg ref.watch
//   }
//   void updateAge(int a)
//   {
//     user=user.copyWith(age:a);
//     notifyListeners();
//   }
//   }
//final userRepositoryProvider=Provider.autoDispose((ref)=>UserRepository(ref));
@riverpod
UserRepository userRepository(UserRepositoryRef ref){

  return UserRepository(ref);
}
class UserRepository  {

 final Ref ref;
 UserRepository(this.ref);

  Future<User> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }

}
