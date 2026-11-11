import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO : 1. Deklarasi variabel yang dibutuhkan
  bool isSignedIn = true;
  String fullname = 'Nama Lengkap Anda';
  String username = 'username_anda';
  int favoriteCandiCount = 0;

  // TODO : 5. Implementasi fungsi SingIn
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  // TODO : 6. Implementasi fungsi LogOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    // TODO : 2. Bagian profileHeader yang berisi gambar Profile
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // TODO : 3. Bagian profilinfo yang berisi info profile
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(
                      width: 120,
                      child: Text(
                        'Pengguna',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(': '),
                    Text(username),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(
                      width: 120,
                      child: Text(
                        'Nama',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(': '),
                    Text(fullname),
                    if (isSignedIn)
                      const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.deepPurple,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(
                      width: 120,
                      child: Text(
                        'Favorit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(': '),
                    Text('$favoriteCandiCount'),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),

                const SizedBox(height: 20),

                // TODO : 4. Buat profileActions yang berisi Textbutton Sign in dan Sign out
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 20),
                isSignedIn
                    ? TextButton(
                        onPressed: signOut, 
                        child: const Text('Sign Out')
                      )
                    : TextButton(
                        onPressed: signIn,
                        child: const Text('Sign In')
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
