import 'package:flutter/material.dart';

import 'components/quoteCard.dart';
import 'models/Quotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quotes App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState(this.title);
}

class _MyHomePageState extends State<MyHomePage> {
  late String title;

  _MyHomePageState(this.title);

  List<Quotes> quotes = [
    Quotes(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"),
    Quotes(
        text:
            "In three words I can sum up everything I've learned about life: it goes on.",
        author: "Robert Frost"),
    Quotes(
        text:
            "The greatest glory in living lies not in never falling, but in rising every time we fall.",
        author: "Nelson Mandela"),
  ];

  void delete(quote) {
    setState(() {
      quotes.remove(quote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quotes
                .map((Quotes quotes) => QuoteCard(
                      quotes: quotes,
                      delete: () => delete(quotes),
                    ))
                .toList(),
          ),
        ));
  }
}
