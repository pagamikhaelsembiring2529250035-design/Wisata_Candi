import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SESUAIKAN: path import ke model dan data candi milikmu
import '../data/candi_data.dart';
import '../models/candi.dart';
import '../screens/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Candi> favoriteCandis = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  // SESUAIKAN: key favorit harus sama dengan yang dipakai di halaman detail
  String favoriteKey(Candi candi) => 'favorite_${candi.name}';

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    // SESUAIKAN: 'candiList' = nama list data candi kamu
    final result = candiList.where((candi) {
      return prefs.getBool(favoriteKey(candi)) ?? false;
    }).toList();

    if (!mounted) return;

    setState(() {
      favoriteCandis = result;
      isLoading = false;
    });
  }

  Future<void> removeFavorite(Candi candi) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(favoriteKey(candi), false);

    if (!mounted) return;

    setState(() {
      favoriteCandis.remove(candi);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${candi.name} dihapus dari favorit'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Batal',
          onPressed: () async {
            await prefs.setBool(favoriteKey(candi), true);
            await loadFavorites();
          },
        ),
      ),
    );
  }

  Future<void> openDetail(Candi candi) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(candi: candi)),
    );

    // Muat ulang, siapa tahu favorit dihapus di halaman detail
    if (!mounted) return;
    await loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favoriteCandis.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'Belum ada candi favorit',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: favoriteCandis.length,
              itemBuilder: (context, index) {
                final candi = favoriteCandis[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => openDetail(candi),
                    child: Row(
                      children: [
                        // SESUAIKAN: candi.imageAsset = field gambar di modelmu
                        Image.asset(
                          candi.imageAsset,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // SESUAIKAN: candi.location
                              Text(
                                candi.location,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => removeFavorite(candi),
                          icon: const Icon(Icons.favorite, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
