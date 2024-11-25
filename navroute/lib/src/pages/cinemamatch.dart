import 'package:flutter/material.dart';

void main() => runApp(MovieMatchApp());

class MovieMatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieMatch',
      theme: ThemeData.dark(),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String apiKey =
      '9540926d9687553a0ce5551c73da26b9'; // Replace with your TMDb API key
  final String baseUrl = 'https://api.themoviedb.org/3';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              )
            : Row(
                children: [
                  Icon(Icons.movie),
                  SizedBox(width: 8),
                  Text('MovieMatch'),
                ],
              ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          MediaCategory(
            category: "TV Series",
            genre: "Action",
            movies: [
              Movie(title: "Mad Max", image: "assets/mad_max.jpg", rating: 8.1),
              Movie(
                  title: "Die Hard", image: "assets/mad_max.jpg", rating: 8.2),
              Movie(
                  title: "John Wick", image: "assets/mad_max.jpg", rating: 7.4),
              Movie(title: "x xxx", image: "assets/mad_max.jpg", rating: 8.1),
              Movie(title: "x xxx", image: "assets/mad_max.jpg", rating: 8.1),
            ],
          ),
          MediaCategory(
            category: "Movies",
            genre: "Romance",
            movies: [
              Movie(
                  title: "The Notebook",
                  image: "assets/mad_max.jpg",
                  rating: 7.9),
              Movie(title: "Titanic", image: "assets/mad_max.jpg", rating: 7.8),
              Movie(
                  title: "Pride & Prejudice",
                  image: "assets/mad_max.jpg",
                  rating: 8.0),
              Movie(title: "x xxx", image: "assets/mad_max.jpg", rating: 8.1),
              Movie(title: "x xxx", image: "assets/mad_max.jpg", rating: 8.1),
            ],
          ),
          MediaCategory(
            category: "Anime",
            genre: "Sci-Fi",
            movies: [
              Movie(
                  title: "Interstellar",
                  image: "assets/mad_max.jpg",
                  rating: 8.6),
              Movie(
                  title: "Inception", image: "assets/mad_max.jpg", rating: 8.8),
              Movie(
                  title: "The Matrix",
                  image: "assets/mad_max.jpg",
                  rating: 8.7),
              Movie(title: "x xxx", image: "assets/mad_max.jpg", rating: 8.1),
              Movie(title: "x xxx", image: "assets/mad_max.jpg", rating: 8.1),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Match',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

class MediaCategory extends StatelessWidget {
  final String category;
  final String genre;
  final List<Movie> movies;

  MediaCategory(
      {required this.category, required this.genre, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      movie.image,
                      width: 120,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        movie.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.yellow),
                          Text(movie.rating.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Movie {
  final String title;
  final String image;
  final double rating;

  Movie({required this.title, required this.image, required this.rating});
}
