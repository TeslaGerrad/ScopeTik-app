import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Color.fromRGBO(250, 39, 91, 25),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Container(
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                      ),
                      const Text(
                        'ScopeTik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(250, 39, 91, 25),
                          ),
                          focusColor: const Color.fromRGBO(250, 39, 91, 25),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(250, 39, 91, 25),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.password_outlined,
                            color: Color.fromRGBO(250, 39, 91, 25),
                          ),
                          focusColor: const Color.fromRGBO(250, 39, 91, 25),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(250, 39, 91, 25),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Log in'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Registration'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
