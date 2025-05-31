import 'package:day4task1/doctorProfile.dart';
import 'package:flutter/material.dart';

class DoctorFinderPage extends StatelessWidget {
  const DoctorFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 20),

              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.grid_view_rounded),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      const SizedBox(width: 6),
                      const Text(
                        "30 May, 2025",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Let's find doctor",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Search Box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(
                    "Dental",
                    Icons.medical_services,
                    Colors.orange.shade100,
                    Colors.orange,
                  ),
                  _buildCategory(
                    "Heart",
                    Icons.favorite,
                    Colors.blue.shade100,
                    Colors.blue,
                  ),
                  _buildCategory(
                    "Brain",
                    Icons.bolt,
                    Colors.green.shade100,
                    Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Top Doctors",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              const SizedBox(height: 16),

              _buildDoctorCard(
                context,
                "Dr. Joseph Church",
                "Dental Speciality",
                "St Bartholomew’s Hospital",
                "\$300",
                Colors.orange,
              ),
              const SizedBox(height: 16),
              _buildDoctorCard(
                context,
                "Dr. David Bryant",
                "Heart Speciality",
                "St Thomas’ Hospital",
                "\$450",
                Colors.purple,
              ),
              const SizedBox(height: 16),
              _buildDoctorCard(
                context,
                "Dr. Robert Adler",
                "Dental Speciality",
                "St Bartholomew’s Hospital",
                "\$300",
                Colors.blueGrey,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(
    String title,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      width: 90,
      height: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(height: 10),
          Text(title, style: TextStyle(color: iconColor)),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(
    BuildContext context,
    String name,
    String specialty,
    String hospital,
    String price,
    Color avatarColor,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DoctorProfilePage(
              name: name,
              specialty: specialty,
              hospital: hospital,
              price: price,
              avatarColor: avatarColor,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: avatarColor,
              child: const Icon(Icons.person, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),

            // Doctor info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(specialty, style: const TextStyle(color: Colors.grey)),
                  Text(hospital, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.access_time, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        "10:30am - 02:30am",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
