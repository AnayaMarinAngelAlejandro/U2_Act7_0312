import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'WWE Anaya 0312'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/Camisa.jpg',
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/F2.jpg',
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/FlutterFlowAct12/Juguete4.jpg',
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/FlutterFlowAct12/Juguete6.jpg',
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/FlutterFlowAct12/Juguete5.jpg',
    'https://raw.githubusercontent.com/AnayaMarinAngelAlejandro/img_iOS/main/FlutterFlowAct12/Juguete2.jpg',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Column(
            children: [
              CarouselSlider(
                items: imgList
                    .map((e) => Center(
                          child: Image.network(e),
                        ))
                    .toList(),
                options: CarouselOptions(
                  initialPage: _currentPage,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
              buildCarouselIndicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == _currentPage ? Colors.black : Colors.grey,
            ),
          )
      ],
    );
  }
}
