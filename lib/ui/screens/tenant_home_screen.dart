import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/models/units_model.dart';
import 'package:hoam_v1/core/resources/themes.dart';

import '../../core/Data/unit_data.dart';
import '../components/header_two.dart';

class TenantHomeScreen extends StatefulWidget {
  const TenantHomeScreen({super.key});

  @override
  State<TenantHomeScreen> createState() => _TenantHomeScreenState();
}

class _TenantHomeScreenState extends State<TenantHomeScreen> {
  final List<Map<String, String>> events = [
    {
      'image':
          'https://i.pinimg.com/736x/d1/32/5d/d1325d1a089a66575984260cd6117936.jpg',
      'title': 'Event 1',
      'date': '2024-09-10',
    },
    {
      'image':
          'https://i.pinimg.com/564x/f4/2d/ba/f42dbaefb858ad96e43e63c59ca73c63.jpg',
      'title': 'Event 2',
      'date': '2024-09-15',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxlAfF8zNkQ8yeU2UZ5bHDUCFoPT6TkLE62w&s',
      'title': 'Event 3',
      'date': '2024-09-20',
    },
    // Add more events here
  ];
  final items = UnitService().getSampleUnits();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight = screenHeight * 0.3;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderTwo(),
              Container(
                width: double.infinity,
                height: containerHeight,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/banner-bg3.jpg'), // Replace with your image asset
                    fit: BoxFit
                        .cover, // Ensures the image covers the entire container
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Promotional Text
                  ],
                ),
              ),
              Gap(20),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Anouncements',
                        style: textTheme(context).copyWith().titleLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text('View All',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 200, // Adjust height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Container(
                        width: 200, // Adjust width as needed
                        margin: EdgeInsets.only(right: 5),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8)),
                                child: Image.network(
                                  event['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 120, // Adjust height as needed
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      event['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      event['date']!,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
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
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Units',
                        style: textTheme(context).copyWith().titleLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text('View All',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 200, // Adjust height as needed
                  child: FutureBuilder<List<UnitModel>>(
                      future: UnitService().getSampleUnits(),
                      builder: (context, snapshot) {
                        // Handle loading state
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        // Handle error state
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        // Handle data when it's available
                        if (snapshot.hasData) {
                          final items = snapshot.data!;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200, // Adjust width as needed
                                margin: EdgeInsets.only(right: 5),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8)),
                                        child: Image.network(
                                          items[index].houseImg!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height:
                                              120, // Adjust height as needed
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              items[index].name!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(items[index].address!,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        // If no data is returned
                        return Center(child: Text('No data found.'));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
