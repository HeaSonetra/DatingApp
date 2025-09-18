import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatefulWidget {
  final String profileId;

  const ProfileDetailScreen({
    super.key,
    required this.profileId,
  });

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;

  // Sample user data - in real app this would come from API
  final Map<String, Map<String, dynamic>> _userData = {
    '1': {
      'name': 'Sophea Chea',
      'age': 25,
      'location': 'Phnom Penh',
      'distance': '2.5km',
      'bio':
          'Love exploring new places and trying different foods. Looking for someone to share adventures with! 🌟',
      'interests': ['Travel', 'Food', 'Photography', 'Music'],
      'photos': [
        'https://i.pinimg.com/736x/2c/12/fa/2c12fad6679b5f8d70e46deb88b7c35c--handsome-boys-chinese.jpg',
        'https://i.pinimg.com/736x/2c/12/fa/2c12fad6679b5f8d70e46deb88b7c35c--handsome-boys-chinese.jpg',
      ],
      'isOnline': true,
    },
    '2': {
      'name': 'Dara Sok',
      'age': 28,
      'location': 'Siem Reap',
      'distance': '15.2km',
      'bio':
          'Artist and nature lover. I enjoy painting landscapes and hiking in the mountains. Let\'s create beautiful memories together! 🎨🏔️',
      'interests': ['Art', 'Hiking', 'Nature', 'Photography'],
      'photos': [
        'https://wallpapercave.com/wp/wp10652766.jpg',
        'https://i.pinimg.com/originals/16/e7/11/16e711b65cdda4fb11b7b00e001fdd1b.jpg',
      ],
      'isOnline': false,
    },
    '3': {
      'name': 'Virak Lim',
      'age': 30,
      'location': 'Battambang',
      'distance': '8.7km',
      'bio':
          'Tech enthusiast and coffee lover ☕. I work in software development and love learning new technologies.',
      'interests': ['Technology', 'Coffee', 'Reading', 'Gaming'],
      'photos': [
        'https://i.pinimg.com/originals/7b/6d/aa/7b6daa8259bb68a7a6f873e56f79479e.jpg',
        'https://wallpapercave.com/wp/wp10652773.jpg',
      ],
      'isOnline': true,
    },
    '4': {
      'name': 'Channary Pich',
      'age': 26,
      'location': 'Phnom Penh',
      'distance': '3.1km',
      'bio':
          'Yoga instructor and health enthusiast 🧘‍♀️. I believe in living a balanced life and spreading positive vibes.',
      'interests': ['Yoga', 'Fitness', 'Meditation', 'Healthy Living'],
      'photos': [
        'https://tse1.mm.bing.net/th/id/OIP.TZotxFovEbGvOJy8BGf4rQHaNK?rs=1&pid=ImgDetMain&o=7&rm=3',
        'https://tse1.mm.bing.net/th/id/OIP.TZotxFovEbGvOJy8BGf4rQHaNK?rs=1&pid=ImgDetMain&o=7&rm=3',
      ],
      'isOnline': true,
    },
  };

  @override
  Widget build(BuildContext context) {
    final user = _userData[widget.profileId];

    if (user == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Profile not found'),
        ),
      );
    }

    final photos = user['photos'] as List<String>;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Image gallery
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: const Color(0xFFE91E63),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Image PageView
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(photos[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),

                  // Image indicators
                  if (photos.length > 1)
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: photos.asMap().entries.map((entry) {
                          return Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentImageIndex == entry.key
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                  // Online status
                  if (user['isOnline'])
                    Positioned(
                      top: 60,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'អនឡាញ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {
                  // Show more options
                },
              ),
            ],
          ),

          // Profile content
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic info
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                user['name'],
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Text(
                              '${user['age']}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${user['location']} • ${user['distance']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Bio
                  if (user['bio'].toString().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'អំពីខ្ញុំ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user['bio'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24),

                  // Interests
                  if ((user['interests'] as List).isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ចំណាប់អារម្មណ៍',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: (user['interests'] as List<String>)
                                .map((interest) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE91E63)
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: const Color(0xFFE91E63)
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                      child: Text(
                                        interest,
                                        style: const TextStyle(
                                          color: Color(0xFFE91E63),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 100), // Space for bottom buttons
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom action buttons
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Pass button
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, size: 20),
                label: const Text('មិនចាប់អារម្មណ៍'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade600,
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Like button
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Show like confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('អ្នកបានចាប់អារម្មណ៍ ${user['name']}!'),
                      backgroundColor: const Color(0xFFE91E63),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.favorite, size: 20),
                label: const Text('ចាប់អារម្មណ៍'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE91E63),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
