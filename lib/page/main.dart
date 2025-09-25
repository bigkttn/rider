import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_rider/page/login.dart';
import 'package:my_rider/page/register.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Mainpage> {
  void _onLoginPressed() {
    // debugPrint("เข้าสู่ระบบ clicked");
    // TODO: ทำการนำทาง หรือเรียก API ได้ที่นี่

    Get.to(() => LoginPage());
    log("tes");
  }

  void _onRegisterPressed() {
    // debugPrint("สมาชิก clicked");
    // TODO: นำทางไปหน้า register ได้ที่นี่
    Get.to(() => RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 412,
          height: 917,
          decoration: BoxDecoration(
            color: const Color(0xFFFF3B30),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              // logo
              Positioned(
                left: 0,
                top: 87,
                child: Container(
                  width: 412,
                  height: 412,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // ปุ่มเข้าสู่ระบบ
              Positioned(
                left: 47,
                top: 472,
                child: InkWell(
                  onTap: _onLoginPressed,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 318,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 5),
                          blurRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xFFFF3B30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ปุ่มสมาชิก
              Positioned(
                left: 47,
                top: 560,
                child: InkWell(
                  onTap: _onRegisterPressed,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 318,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 5),
                          blurRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "สมาชิก",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xFFFF3B30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
