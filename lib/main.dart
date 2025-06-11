import 'package:flutter/material.dart';
import 'categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffE4E4E4), width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.close, size: 24),
                    ),
                    const SizedBox(width: 32),
                    const Text(
                      "Find doctors",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),

              // Location bar
              Container(
                width: double.infinity,
                color: const Color(0xFF003F7D),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "Chandigarh, India | Sector 26, main market",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Change",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/doctor_patient.jpg',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffE4E4E4), width: 1),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for Doctors, Symptoms etc.",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Top-searched specialities",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double totalSpacing = 20 * 2;
                    double itemWidth =
                        (constraints.maxWidth - totalSpacing) / 3;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        for (var item in [
                          {'icon': Icons.star, 'label': 'Best picks'},
                          {'icon': Icons.person, 'label': 'Physician'},
                          {'icon': Icons.medical_services, 'label': 'Dentist'},
                          {'icon': Icons.local_dining, 'label': 'Nutritionist'},
                          {'icon': Icons.favorite, 'label': 'Sexologist'},
                          {'icon': Icons.psychology, 'label': 'Psychologist'},
                        ])
                          SizedBox(
                            width: itemWidth,
                            child: item['label'] == 'Best picks'
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Categories(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color(0xffE4E4E4),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: Icon(
                                            item['icon'] as IconData,
                                            size: 56,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          item['label'] as String,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xffE4E4E4),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Icon(
                                          item['icon'] as IconData,
                                          size: 56,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item['label'] as String,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
