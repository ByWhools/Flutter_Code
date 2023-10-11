import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String? title;
String? markdow;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot codeCollecion = await firestore.collection('Code').get();

  Map<String, WidgetBuilder> dynamicRoutes = {};
  codeCollecion.docs.forEach((code) {
    String title = code['title'];
    String markdown = code['markDown'];
    String img = code['img'];
    String linkrepo = code['linkrepo'];
    String route = '/TechHub/${title.replaceAll(' ', '-')}';
    dynamicRoutes[route] = (context) => MarkDownCode(
          title: title,
          markdown: markdown,
          img: img,
          linkrepo: linkrepo,
        );
  });

  runApp(
    const RoutesFirebaseCustom()
  );
  class RoutesFirebaseCustom extends StatelessWidget {
  const RoutesFirebaseCustom({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Whools Web',
            routes: {
              ...dynamicRoutes,
              '/': (context) => const LeadingPage(),
              '/TechHub': (context) => const BlogCode(),
            },
          );
  }
}
}





