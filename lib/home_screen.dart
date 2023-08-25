import 'package:riverrrr/user.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}




class _MyHomePageState extends ConsumerState<MyHomePage>{
String userNo='1';

//widget ref allow u to communicate to other provider

  // ref.read(nameProvider.notifier).update((state) => value);//to update the value

  // ref.read(nameProvider.notifier).update((state) => value);//to update the value

  @override
  Widget build(BuildContext context) {
   return  ref.watch(fetchUserProvider(input:userNo,someValue:1,secondValue:false)).when(
    data: (data) {
      return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value)=>setState(() {
                userNo= value ;
              }),
            ),
            Center(
              child: Text(data.name),
            ),
          ],
        ),


      );
    },
    error: (error,stackTrace){
      return Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: Text(
            error.toString(),
          ),
        ),
      );
    },
    loading:(){
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
);
  // this is the third type of ref
  //   ref.read is one time only just one for continously changes we use watch

    // return Scaffold(
    //     body:ref.watch(streamProvider).when(
    //     data: (data) {
    //       return Text(data.toString());
    //
    //     },
    //     error: (error, stackTrace) {
    //       return  Center(
    //           child: Text(
    //             error.toString(),
    //           ),
    //
    //       );
    //     },
    //     loading: () {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     })
    // );
  }
}
