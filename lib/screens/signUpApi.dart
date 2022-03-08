import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

void Login(String email, password) async {
  try {
    Response response =
        await post(Uri.parse('https://reqres.in/api/register'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      print("Account Created");
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Login(emailcontroller.text.toString(),
                    passwordcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("SignUp")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
