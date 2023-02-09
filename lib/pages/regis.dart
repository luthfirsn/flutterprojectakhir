import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/button_login.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late bool _passwordVisible;
  late bool _confirmpasswordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    _confirmpasswordVisible = false;
  }

  // sign user up method
  void signUserUp() async {
    // show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    // // try creating the user
    // try {
    //   // check if password is confirmed
    //   if (passwordController.text == confirmPasswordController.text) {
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       // name : nameController.text,
    //       email: emailController.text,
    //       password: passwordController.text,
    //     );
    //   } else {
    //     // show error message, passwords don't match
    //     showErrorMessage("Passwords don't match!");
    //   }
    //   // pop the loading circle
    //   Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   // pop the loading circle
    //   Navigator.pop(context);
    //   // show error message
    //   showErrorMessage(e.code);
    // }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.cancel_outlined,
            size: 50,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 25),
                Image.asset(
                  "images/logo6.png",
                  width: 200,
                  height: 100,
                ),
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                // // logo
                // const Icon(
                //   Icons.discord,
                //   size: 50,
                // ),

                const SizedBox(height: 25),

                // // let's create an account for you
                // Text(
                //   'Let\'s create an account for you!',
                //   style: TextStyle(
                //     color: Colors.grey[700],
                //     fontSize: 16,
                //   ),
                // ),

                const SizedBox(height: 25),
                // email textfield
                MyTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    controller: emailController,
                    obscureText: false, //This will obscure text dynamically
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade800,
                      filled: true,

                      hintStyle: TextStyle(color: Colors.grey[500]),
                      hintText: 'Email',
                      // Here is key idea
                    ),
                  ),
                ),
                // MyTextField(
                //   controller: emailController,
                //   hintText: 'Email',
                //   obscureText: false,
                //   textCapitalization: TextCapitalization.none,
                // ),

                const SizedBox(height: 10),

                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText:
                        !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      // enabledBorder: const OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade800,
                      filled: true,

                      hintStyle: TextStyle(color: Colors.grey[500]),
                      hintText: 'Password',
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // MyTextField(
                //   controller: passwordController,
                //   hintText: 'Password',
                //   obscureText: true,
                //   textCapitalization: TextCapitalization.none,
                // ),

                const SizedBox(height: 10),

                // confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    controller: confirmPasswordController,
                    obscureText:
                        !_confirmpasswordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      // enabledBorder: const OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey.shade800,
                      filled: true,

                      hintStyle: TextStyle(color: Colors.grey[500]),
                      hintText: 'Confirm Password',
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _confirmpasswordVisible = !_confirmpasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // MyTextField(
                //   controller: confirmPasswordController,
                //   hintText: 'Confirm Password',
                //   obscureText: true,
                //   textCapitalization: TextCapitalization.none,
                // ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    Random random = new Random();
                    int randomNumber = random.nextInt(99999999);

                    // try creating the user
                    try {
                      // check if password is confirmed
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              // name : nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            )
                            .then((value) => {
                                  FirebaseFirestore.instance
                                      .collection("alumni")
                                      .doc(value.user!.uid)
                                      .set({
                                    "name": nameController.text,
                                    "email": emailController.text,
                                    "saldo": 0,
                                    "noRek": randomNumber,
                                  })
                                });
                      } else {
                        // show error message, passwords don't match
                        showErrorMessage("Passwords don't match!");
                      }
                      // pop the loading circle
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      // pop the loading circle
                      Navigator.pop(context);
                      // show error message
                      showErrorMessage(e.code);
                    }
                  },
                ),

                const SizedBox(height: 10),
                // punya akun
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
                Text(
                  'By registering, you agree to Apps Terms of Service and Privacy Policy.',
                  style: TextStyle(color: Colors.grey[700], fontSize: 9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
