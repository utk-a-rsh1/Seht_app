import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategory = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': "assets/icons/best.svg", 'label': 'Best picks'},
    {'icon': "assets/icons/physician.svg", 'label': 'Physician'},
    {'icon': "assets/icons/Dentist.svg", 'label': 'Dentist'},
    {'icon': "assets/icons/Nutri.svg", 'label': 'Nutritionist'},
    {'icon': "assets/icons/Nutri.svg", 'label': 'Sexologist'},
    {'icon': "assets/icons/Nutri.svg", 'label': 'Psychologist'},
  ];

  final List<Map<String, dynamic>> doctors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffE4E4E4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.arrow_back_ios, size: 24),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Find doctors",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Noida",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(width: 1, height: 20, color: Color(0xffE4E4E4)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                border: InputBorder.none,
                                hintText: "Search for Doctors",
                                hintStyle: TextStyle(fontSize: 16),
                                suffixIcon: Icon(Icons.search, size: 26),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Categories bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 56,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        final isSelected = selectedCategory == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedCategory = index);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  item['icon'],
                                  height: 24,
                                  width: 24,
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item['label'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 3,
                                  width: isSelected ? 48 : 0,
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),

          // 🧱 BOTTOM SCROLLABLE SECTION
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final List<Map<String, String>> hospitals = [
                      {
                        'image': 'assets/images/hosp1.jpg',
                        'name': 'Greenwood Countryside Health Hospital',
                      },
                      {
                        'image': 'assets/images/hosp2.jpg',
                        'name': 'Lotus Wellness & Diagnostic Center',
                      },
                      {
                        'image': 'assets/images/hosp3.jpg',
                        'name': 'Aarogya Multispecialty Clinic',
                      },
                      {
                        'image': 'assets/images/hosp4.jpg',
                        'name': 'Sunrise Family Care Hospital',
                      },
                      {
                        'image': 'assets/images/hosp5.jpg',
                        'name': 'Fortune City Health Point',
                      },
                    ];

                    final hospital = hospitals[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 8,
                                    bottom: 0,
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          hospital['image']!,
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                          ),
                                          child: const Text(
                                            'Open',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hospital['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '4.9 rating',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      SizedBox(width: 12),
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '800 mtr - 8 min away',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
