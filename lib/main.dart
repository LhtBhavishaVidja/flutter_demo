import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/home_page.dart';

import 'form_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    if(!_form.currentState!.validate())
      {
        _form.currentState!.validate();
      }
    else
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage()
        ));
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: ValidationBuilder().email().maxLength(50).build(),
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator:
                ValidationBuilder().minLength(5).maxLength(50).build(),
                decoration: InputDecoration(
                  labelText: 'Name',
                  helperText: 'Min length: 5, max length: 50',
                ),
              ),TextFormField(
                validator:
                ValidationBuilder().phone().maxLength(15).build(),
                decoration: InputDecoration(
                  labelText: 'Phone number',

                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validate,
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
