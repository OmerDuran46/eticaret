// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/ui/screens/login/login_pages.dart';

class UpdatePasswordPage extends ConsumerStatefulWidget {
  const UpdatePasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends ConsumerState<UpdatePasswordPage> {
  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Material(
        color: Colors.black87,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  const Center(
                    child: Text(
                      "Şifre Değiştirin",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Şifre",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Yeni şifre",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      hintText: "Yeni şifre tekrar",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  const CustomerLogin(),));
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text("Parola Değiştir"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favoriler"),
        BottomNavigationBarItem(icon: Icon(Icons.category_sharp), label: "Kategoriler"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: "Sepet"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Hesabım"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      onTap: onTapped,
    );
  }
}
