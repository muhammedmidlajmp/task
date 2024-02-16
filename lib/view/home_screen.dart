import 'package:flutter/material.dart';
import 'package:task_one/controller/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: AlertDialog(
        backgroundColor: Colors.grey,
        content: SizedBox(
          height: 200,
          width: 200,
          child: const Center(
              child: Text(
            'Welcome',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back')),
          ElevatedButton(
              onPressed: () async {
                Api obj = Api();
                await obj.postData();
                bool status = await obj.postData();
                if (status == true) {
                  showSnakbar('Success', context, status);
                }
                if (status == false) {
                  showSnakbar('Faild', context, status);
                }
              },
              child: const Text('Fetch Data')),
        ],
      ),
    );
  }

  showSnakbar(String content, context, bool status) {
    return AlertDialog(
      backgroundColor: status ? Colors.green : Colors.red,
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('ok'))
      ],
    );
  }
}
