import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Example chapter data with unique IDs for dynamic handling
  final List<Map<String, dynamic>> chapters = [
    {
      "id": "chapter1", // Unique ID for chapter
      "name": "Touchtap App",
      "role": "President",
      "members": 39,
      "image": "https://via.placeholder.com/250x120", // Replace with uploaded image URL
    },
    {
      "id": "chapter2",
      "name": "Another Chapter",
      "role": "Member",
      "members": 24,
      "image": "https://via.placeholder.com/250x120",
    },
  ];

  final String userName = "Amal Krishna"; // Replace with dynamic user data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF9575CD), // Purple accent
                      ),
                    ),
                    Text(
                      "$userName,", // Dynamic user name
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // My Chapters Section
            const Text(
              "My Chapters",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chapters.length, // Dynamic chapter count
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to Edit Chapter Page with Chapter ID
                      Navigator.pushNamed(context, '/edit_chapter',
                          arguments: chapter["id"]);
                    },
                    child: Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Chapter Image
                          ClipRRect(
                            borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              chapter["image"], // Dynamic image URL
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chapter["name"], // Dynamic chapter name
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${chapter["role"]} · ${chapter["members"]} members",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // My Meetings Section
            const Text(
              "My Meetings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Add dynamic meetings list or placeholder
            const Text("Meeting list goes here..."),

            // See All Meetings Button
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/meetings'); // Navigate to Meetings Page
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color(0xFF7C64B4), // Updated to avoid `primary` issue
                ),
                child: const Text(
                  "See All Meetings",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
