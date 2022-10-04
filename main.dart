import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  final List<String> imagesUrl = [
    'https://gas-kvas.com/uploads/posts/2022-06/1655484079_28-gas-kvas-com-p-nerealnie-foto-prirodi-32.jpg',
    'https://phonoteka.org/uploads/posts/2021-09/1631660145_49-phonoteka-org-p-kartinki-dlya-fona-priroda-krasivo-52.jpg',
    'https://vsegda-pomnim.com/uploads/posts/2022-04/1649121829_2-vsegda-pomnim-com-p-zhivopisnaya-priroda-foto-2.jpg',
    'https://i.pinimg.com/originals/1b/31/10/1b31109eb7686f9009b627d9c75c6c31.jpg',
    'https://drasler.ru/wp-content/uploads/2018/12/2694651391.jpg',
    'https://gas-kvas.com/uploads/posts/2022-06/1655374817_13-gas-kvas-com-p-foto-kartinki-priroda-14.jpg'
  ];
  @override
  void initState() {
    log(imagesUrl.toString());
    setState(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.indigo,),
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagesUrl.length,
                  itemBuilder: (context, index) => Container(
                    height: 350,
                    width: 500,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                          image: NetworkImage(
                            imagesUrl[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: imagesUrl.length,
                effect: SwapEffect(activeDotColor: Colors.blue),
                onDotClicked: (index) {},
              ),
            ],
          ),
        ));
  }
}
