import 'package:azkar/constants.dart';
import 'package:azkar/screens/app/prayers_collection_list_screen.dart';
import 'package:flutter/material.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'قائمة الاذكار',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        flexibleSpace: const Image(
          image: AssetImage('images/back.png'),
          fit: BoxFit.cover,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/prayer_times_screen');
            },
            icon: Image.asset(
              'images/rock.png',
              width: 25,
              height: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/search.png',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PrayersCollectionListScreen(category[index]),
                    ),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    category[index].image,
                  ),
                  title: Text(
                    category[index].name,
                    style: const TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text('${category[index].subCategory.length} أذكار'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
