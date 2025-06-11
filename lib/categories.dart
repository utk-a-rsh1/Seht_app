import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategory = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.star, 'label': 'Best picks'},
    {'icon': Icons.person, 'label': 'Physician'},
    {'icon': Icons.medical_services, 'label': 'Dentist'},
    {'icon': Icons.local_dining, 'label': 'Nutritionist'},
    {'icon': Icons.favorite, 'label': 'Sexologist'},
    {'icon': Icons.psychology, 'label': 'Psychologist'},
  ];

  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Sukh sadan clinic',
      'image': 'assets/images/doctor1.jpg',
      'distance': '1km',
      'time': '10 min away',
      'rating': '4.8',
      'location': 'Jaypee Pavilion Court 1, Pavilion Heights Block Pt-1, Noida',
    },
    {
      'name': 'Dr. Alan Hathaway',
      'image': 'assets/images/doctor2.jpg',
      'distance': '1km',
      'time': '10 min away',
      'rating': '4.8',
      'location': 'Jaypee Pavilion Court 1, Pavilion Heights Block Pt-1, Noida',
    },
    {
      'name': 'Dr. Mithun Hastir Clinic',
      'image': 'assets/images/doctor3.jpg',
      'distance': '1km',
      'time': '10 min away',
      'rating': '4.8',
      'location': 'Jaypee Pavilion Court 1, Pavilion Heights Block Pt-1, Noida',
    },
    {
      'name': 'Dr. Deoz clinic',
      'image': 'assets/images/doctor_patient.jpg',
      'distance': '1km',
      'time': '10 min away',
      'rating': '4.8',
      'location': 'Jaypee Pavilion Court 1, Pavilion Heights Block Pt-1, Noida',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffE4E4E4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Heart pain',
                        hintStyle: const TextStyle(fontSize: 14),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xffE4E4E4),
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffE4E4E4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.filter_list, size: 24),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    final isSelected = selectedCategory == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedCategory = index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Icon(
                              item['icon'],
                              size: 35,
                              color: isSelected
                                  ? Colors.blueAccent
                                  : const Color.fromARGB(67, 68, 137, 255),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['label'],
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                            if (isSelected)
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                height: 2,
                                width: 35,
                                color: Colors.black,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: const Text(
                'Results for “heart pain”',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),

            // Grey container starts from here
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xffF2F3F7)),
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  children: [
                    ...doctors.map((doc) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row: image + right side content
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Doctor Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    doc['image'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey[300],
                                      child: const Icon(
                                        Icons.image_not_supported,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Text info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doc['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Color(0xffF2F3F7),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.location_on,
                                              color: Colors.blueAccent,
                                              size: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${doc['distance']} • ${doc['time']}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Color(0xffF2F3F7),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.star,
                                              color: Colors.blueAccent,
                                              size: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            doc['rating'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Location line (full-width)
                            Text(
                              doc['location'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
