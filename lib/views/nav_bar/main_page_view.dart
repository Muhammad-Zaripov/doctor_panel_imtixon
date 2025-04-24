import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: isDark ? null : Colors.white,
        title: Text("Bo'limlar", style: TextStyle()),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color:
                      isDark ? Color.fromARGB(255, 39, 39, 39) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    isDark
                        ? BoxShadow()
                        : BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'qidirish',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),

              SizedBox(height: 24),

              Text(
                "Bo'limlar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: isDark ? null : Colors.blueGrey.shade50,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/image1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Card(
                      color: isDark ? null : Colors.blueGrey.shade50,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/image2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Card(
                      color: isDark ? null : Colors.blueGrey.shade50,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/image3.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Card(
                      color: isDark ? null : Colors.blueGrey.shade50,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/image4.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bo'limlar",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: Text('Barchasi')),
                ],
              ),
              SizedBox(height: 20),
              Card(
                color: isDark ? null : Colors.blueGrey.shade50,
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/image5.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: isDark ? null : Colors.blueGrey.shade50,
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/image6.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Card(
                color: isDark ? null : Colors.blueGrey.shade50,
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/image5.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: isDark ? null : Colors.blueGrey.shade50,
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/image6.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
