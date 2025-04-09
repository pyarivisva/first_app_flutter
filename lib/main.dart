import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  // Menjalankan aplikasi MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'First App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // method build untuk selalu build setiap kali ada perubahan widget
    var appState = context.watch<MyAppState>();
    // method watch untuk melacak perubahan status aplikasi

    return Scaffold(
      body: Column(
        children: [
          Text('Sebuah kata acak:'),
          Text(appState.current.asPascalCase),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
              // setiap menekan button, kata random akan berubah
              // print('tombol di tekan!');
            },
            child: Text('Selanjutnya'),
          ),
        ],
      ),
    );
  }
}
