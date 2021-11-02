import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dear_feature/TextInputCubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider(
        create: (context) => TextInputCubit(),
        child: InputWidget(),
      )
    );
  }
}

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise_6_2'),
      ),
      body: Center(
        child: BlocBuilder<TextInputCubit, String>(
                bloc: context.read<TextInputCubit>(),
                builder: (context, state) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter word: ',
                              border: const OutlineInputBorder(),
                            ),
                            onChanged: (String? value) {
                              state = value!;
                            },
                          ),
                        ),
                        ElevatedButton(child: Text('Capitalise'),
                        onPressed: () {
                                  context.read<TextInputCubit>().capitalise(state);
                                },
                        ),
                        Container(
                          height: 100,
                          margin: const EdgeInsets.only(top: 50, bottom: 10, right:50, left: 50),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('$state', style:TextStyle(fontSize: 25, color:Colors.cyan))],
                          ),
                        )
                      ],
                    );
                  }),                 
      )          
    );
  }
}
