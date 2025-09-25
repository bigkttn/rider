import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_rider/page/login.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key});

  @override
  State<RegisterPage1> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage1> {
  bool isSelectUser = true; // ✅ เปิดมาจะเจอ User form เลย
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🔴 ส่วนหัว
          Container(
            width: double.infinity,
            height: 200,
            color: const Color(0xFFFF3B30),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'สมัครสมาชิก',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ปุ่มผู้ใช้
                    _buildRoleButton("ผู้ใช้ระบบ", isSelectUser, () {
                      setState(() => isSelectUser = true);
                    }),
                    const SizedBox(width: 10),
                    // ปุ่มไรเดอร์
                    _buildRoleButton("ไรเดอร์", !isSelectUser, () {
                      setState(() => isSelectUser = false);
                    }),
                  ],
                ),
              ],
            ),
          ),

          // 🔴 เนื้อหา scroll ได้
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isSelectUser) _buildUserForm(),
                  if (!isSelectUser) _buildRiderForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------
  // 🔧 UI Helper Widgets
  // ----------------------

  Widget _buildRoleButton(String text, bool isActive, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: const Size(150, 50),
        backgroundColor: isActive ? Colors.white : const Color(0xFFFF3B30),
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? const Color(0xFFFF3B30) : Colors.white,
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFF3B30),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // ----------------------
  // 👤 ฟอร์มผู้ใช้
  // ----------------------
  Widget _buildUserForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(''), // TODO: ใส่ path รูปจริง
          ),
        ),
        const SizedBox(height: 10),

        _buildLabel("ชื่อ"),
        _buildTextField("กรุณากรอกชื่อ"),
        const SizedBox(height: 10),

        _buildLabel("อีเมล"),
        _buildTextField("กรุณากรอกอีเมล"),
        const SizedBox(height: 10),

        _buildLabel("หมายเลขโทรศัพท์"),
        _buildTextField("กรุณากรอกหมายเลขโทรศัพท์"),
        const SizedBox(height: 10),

        _buildLabel("รหัสผ่าน"),
        _buildTextField("กรุณากรอกรหัสผ่าน", obscure: true),
        const SizedBox(height: 10),

        _buildLabel("ที่อยู่"),
        _buildTextField("กรุณากรอกที่อยู่"),
        const SizedBox(height: 10),

        _buildLabel("พิกัด GPS"),
        _buildTextField("กรุณาปักหมุดแผนที่"),
        const SizedBox(height: 10),

        // 🗺️ แผนที่
        SizedBox(
          height: 300,
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(15.8700317, 100.99254),
              initialZoom: 15.0,
              onTap: (tapPosition, point) {
                log("เลือกพิกัด: $point");
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=d7b6821f750e49e2864ef759ef2223ec',
                userAgentPackageName: 'com.example.my_rider',
                maxNativeZoom: 19,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(15.8700317, 100.99254),
                    width: 40,
                    height: 40,
                    child: Container(color: Colors.amber),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // ปุ่มสมัคร
        Center(
          child: TextButton(
            onPressed: () {
              // TODO: เขียน logic สมัครสมาชิก
            },
            style: TextButton.styleFrom(
              fixedSize: const Size(200, 50),
              backgroundColor: const Color(0xFFFF3B30),
            ),
            child: const Text(
              "สมัครสมาชิก",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // ลิงก์ไป login
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("หากเป็นสมาชิกแล้ว?"),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                ' เข้าสู่ระบบ',
                style: TextStyle(
                  color: Color(0xFFFF3B30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ----------------------
  // 🚴 ฟอร์มไรเดอร์
  // ----------------------
  Widget _buildRiderForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "ฟอร์มสำหรับไรเดอร์ (TODO: ใส่ฟิลด์)",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
