import 'package:flutter/material.dart';

class HomeriderPage extends StatelessWidget {
  const HomeriderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Layer สีแดง
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFFF3B30),
          ),

          // Layer สีขาวทับด้านล่าง
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 64),

                // Header (Avatar + สวัสดี + ปุ่มแก้ไข)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 23),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "สวัสดี",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              // TODO: ไปหน้าแก้ไขข้อมูลส่วนตัว
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "แก้ไขข้อมูลส่วนตัว",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFFF3B30),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // รายการงาน (ใช้ Expanded + ListView)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    children: [
                      _buildJobCard(
                        title: "คณะวิทยาการสารสนเทศ",
                        subtitle: "หอเดอะพีช",
                      ),
                      _buildJobCard(
                        title: "ร่มเย็นแมนชั่น",
                        subtitle: "เดอะพีช",
                      ),
                      _buildJobCard(
                        title: "ร้านชาวัว​ไทย​สาขา​มมมส.ใหม่​",
                        subtitle: "KFC PTTOR U Park",
                      ),
                      _buildJobCard(
                        title: "ม.ใหม่ไก่ย่าง",
                        subtitle: "หอพักเดอะเบส",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 76,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _BottomNavItem(
                    icon: Icons.home,
                    label: "หน้าแรก",
                    isActive: true,
                  ),
                  _BottomNavItem(
                    icon: Icons.delivery_dining,
                    label: "ที่ต้องไปส่ง",
                  ),
                  _BottomNavItem(icon: Icons.logout, label: "ออกจากระบบ"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget card งาน
  Widget _buildJobCard({required String title, required String subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: ฟังก์ชันรับงาน
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF3B30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(144, 38),
              ),
              child: const Text(
                "รับงาน",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Bottom Nav Item
class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? Colors.red : Colors.black),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}
