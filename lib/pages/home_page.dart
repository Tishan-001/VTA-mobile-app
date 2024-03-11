import 'package:flutter/material.dart';
import 'package:vta_mobile/blog.dart';
import 'package:vta_mobile/user.dart';
import 'package:vta_mobile/widgets/blog_widget.dart';
import 'package:vta_mobile/widgets/homepage_menu_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Blog> blogsList;
  late User user;
  late Blog blog;
  @override
  void initState() {
    // TODO: implement initState
    user = User(firstName: 'Ema', lastName: 'Andeson');
    user.profileImage = 'profile_image.png';
    String title = 'Best Places to visit in Sri Lanka';
    String description =
        '''With ornate ponds, royal sleeping chambers and majestic lion paws carved into the base of the rock, the colossal granite fortress of Sigiriya is easily Sri Lanka’s most recognizable site, peeking out of a thick jungle canopy for a glimpse of the ancient kingdom of Kassapa.

Although its frescoes – images of bare-breasted women adorned in jewelry with flowers in their hair – are famous, the view from the top of the rock is unparalleled. A hush of calm echoes over the terraced summit, which covers 1.6 hectares (4 acres). ''';
    String image = 'blog_image.png';
    blog = Blog(title: title, description: description, image: image);
    blogsList = [
      blog,
      blog,
      blog,
      blog,
      blog,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xffffffff), Color(0xffd6e6f2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: AssetImage('assets/${user.profileImage}'),
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  '${user.firstName} ${user.lastName}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                iconSize: 35,
              )
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomePageMenueItem(context, 'Travel Plan', 'travel_plan.png'),
              HomePageMenueItem(context, 'Tour Guiders', 'tour_guider.png'),
              HomePageMenueItem(context, 'Trasnsport', 'transport.png'),
              HomePageMenueItem(
                  context, 'Hotel\nReservation', 'hotel_reservation.png'),
              HomePageMenueItem(context, 'Health Care', 'health_care.png'),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What are you Looking for',
                      border: InputBorder.none,
                      //TODO: Impliment search functionality here
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: blogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return blogs(blogsList[index]);
              },
            ),
          )
        ]),
      ),
    ));
  }
}
