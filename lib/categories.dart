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

  final List<Map<String, dynamic>> doctors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: Column(
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
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffE4E4E4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.arrow_back),
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
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
                              size: 18,
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
                          height: 50,
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
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  item['icon'],
                                  size: 24,
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item['label'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 3,
                                  width: isSelected ? 32 : 0,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
