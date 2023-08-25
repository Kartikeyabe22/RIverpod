import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverrrr/loger_riverpod.dart';
import 'package:riverrrr/user.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_generator/builder.dart';
part 'main.g.dart';
//Providers.It is a read only
//1)provider object which provides data .
//2)StateProvider is used to update the value which is not posiible by Provider.udpdate a sate like int or boolean
//3)ChangeNotifierProvider
//ref allow us to talk with other provider
//globally declared
//State Provider is used for very simple value like boolean double int but for complex value
//StateNotifier and StateNotifierProvider
//FutureProvider it is based on http calls even firebase calls
//it will make ur life much more easier
// StreamProvider
//WidgetRef help us to talk from widget to a provider
//ProviderRef
//Ref
//ProviderObserver to figure out where the provider is added or removed
@riverpod
Future<User> fetchUser(FetchUserRef ref,{required String input,required int someValue,required bool secondValue}) {
  final userRepository=ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
}
// final fetchUserProvider=FutureProvider.family.autoDispose((ref,String input){
//
// final userRepository=ref.watch(userRepositoryProvider);
// return userRepository.fetchUserData(input);
// });

final streamProvider=StreamProvider.autoDispose((ref) async* {

   yield [1,2,3,4,5,6,7,8,9,10,11,12];
});
void main() {
  runApp(
      ProviderScope(
        observers: [
        LoggerRiverpod(),
        ],

          child:MyApp(),
      ),
      

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
