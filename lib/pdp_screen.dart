import 'package:flutter/material.dart';

class PDPScreen extends StatefulWidget {
  final Map<String, dynamic> doctor;

  const PDPScreen({super.key, required this.doctor});

  @override
  State<PDPScreen> createState() => _PDPScreenState();
}

class _PDPScreenState extends State<PDPScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: doctor['images'].length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      doctor['images'][index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildShadowedIcon(Icons.arrow_back, () {
                      Navigator.pop(context);
                    }),
                    _buildShadowedIcon(Icons.share, () {}),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                transform: Matrix4.translationValues(0, -24, 0),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor['name'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text('${doctor['rating']}'),
                        const SizedBox(width: 16),
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(doctor['location']),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      doctor['description'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadowedIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black26)],
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
