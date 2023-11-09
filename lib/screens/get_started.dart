import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_outlined),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'How it',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                        TextSpan(
                          text: ' works',
                          style: TextStyle(color: Colors.orange, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/image.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
              ),
              const Column(
                children: [
                  Text(
                    'Manage Your',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text('Everyday task list',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ],
              ),
              const Text(
                textAlign: TextAlign.center,
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    fixedSize: const Size(200, 50)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
