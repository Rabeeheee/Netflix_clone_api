import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '  🍿 Coming Soon  ',
                ),
                Tab(
                  text: "  🔥 Everyone's watching  ",
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://i.ebayimg.com/images/g/nyoAAOSw0P9hz5Vh/s-l1600.jpg',
                    overview:
                        ' the main character, Geralt of Rivia, is destined to navigate a dangerous and complex world where the lines between good and evil are often blurred, and his life is inherently tied to a powerful and sometimes uncontrollable fate, much like a wild beast.',
                    logoUrl:
                        "https://static.displate.com/1200x857/displate/2022-06-01/d45c30759431a68846acca42987466e2_c830748a127d5c5c17a9f5ad2c76ada5.jpg",
                    month: "Feb",
                    day: "11",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://m.media-amazon.com/images/M/MV5BNDBmODUzMmQtOWRlMi00ODMwLTg1NjAtM2Y4NzQxMjgyOTFlXkEyXkFqcGc@._V1_.jpg',
                    overview:
                        'Former CIA spies Emily and Matt are pulled back into espionage after their secret identities are exposed.',
                    logoUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSkeghiTOnL_dZKpXB-yc0t-W5JoLW8-HO4g&s",
                    month: "Jan",
                    day: "17",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: ComingSoonMovieWidget(
                imageUrl:
                    'https://m.media-amazon.com/images/M/MV5BZDQwMjUzYWItOWFlYS00ZmJmLWFhNWUtMjY1NzkxM2M5ODg1XkEyXkFqcGc@._V1_.jpg',
                overview:
                    'A young airline security guard is blackmailed by a mysterious passenger who threatens to smuggle a dangerous package onto a plane on Christmas Eve.',
                logoUrl:
                    "https://www.filmofilia.com/wp-content/uploads/2024/12/Carry-On.webp",
                month: "Dec",
                day: "13",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}