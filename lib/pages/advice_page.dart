import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:svg_flutter/svg.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  String advice = '';
  int adviceId = 0;
  final dio = Dio();
  void request() async {
    Response response;
    response = await dio.get('https://api.adviceslip.com/advice');
    print(response.data.toString());
    final Map<String, dynamic> jsonMap = jsonDecode(response.data);
    advice = jsonMap['slip']['advice'];
    adviceId = jsonMap['slip']['id'];
    print(advice);
    print(adviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.3,
        height: MediaQuery.of(context).size.height / 3,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.white, blurRadius: 20)],
            borderRadius: BorderRadius.all(Radius.circular(19))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'ADVICE #$adviceId',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.green),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              advice,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/images/pattern-divider-mobile.svg',
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    request();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 15)
                  ], shape: BoxShape.circle, color: Colors.green),
                  child: SvgPicture.asset(
                    'assets/images/icon-dice.svg',
                    width: 40,
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
/* Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(advice),
          Text(adviceId.toString()),
          ElevatedButton(
            onPressed: () {
              setState(() {
                request();
              });
            },
            child: const Text('Click'),
          ),
        ],
      ) */