import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/controller/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Api>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: AlertDialog(
          backgroundColor: Colors.grey,
          content: const SizedBox(
            height: 200,
            width: 200,
            child: Center(
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
                // Api obj = Api(); // Remove this line
                await value.postData(); // Use the existing instance

                if (value.status == true) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Success'),
                      ),
                    );
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Failed'),
                      ),
                    );
                  }
                }
              },
              child: const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }

  showSnakbar(String content, context, bool status) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: status ? Colors.green : Colors.red,
        content: Text(content),
      ),
    );
  }
}
