import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:service_request/models/test_model.dart';
import 'package:service_request/service/test_model_repository.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TestModelRepository testModelRepository;
  late final Dio dio;
  List<Test>? items;
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    dio = Dio();
    testModelRepository = TestModelRepository(dio: dio);
    dio.options = BaseOptions(baseUrl: testModelRepository.baseUrl);
    items = await testModelRepository.fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(items![index].id.toString()),
          title: Text(items![index].title!),
          subtitle: Text(items![index].body!),
        );
      },
    ));
  }
}
