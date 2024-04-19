import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app_ui/models/data/data.dart';
import 'package:travel_app_ui/widgets/big_text.dart';
import 'package:travel_app_ui/widgets/tab_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  //Animations
  late AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));

  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    slideAnimation = Tween(begin: const Offset(-1, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SlideTransition(
              position: slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //customAppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(228, 125, 12, 1),
                              maxRadius: 30,
                              child: Image.asset(
                                "assets/images/profile-image-removebg-preview.png",
                                width: 58,
                              ),
                            ),
                          ),
                          const BigText(text: "     Hi, Gurmad!", fontSize: 14),
                        ],
                      ),
                      const Badge(
                        label: Text("9+"),
                        backgroundColor: Color.fromARGB(255, 223, 48, 36),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Color.fromRGBO(228, 125, 12, 1),
                        ),
                      )
                    ],
                  ),
                  //space
                  const SizedBox(height: 20),

                  //body
                  const BigText(
                      text: "  Where do\n  you want to go?", fontSize: 24),

                  //space
                  const SizedBox(height: 20),

                  //search bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 290,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Search for a destination",
                            hintStyle: const TextStyle(
                                color: Colors.black54, fontSize: 14),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              child: Icon(Iconsax.search_normal,
                                  color: Color.fromRGBO(245, 128, 3, 1),
                                  size: 23),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(228, 125, 12, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(FontAwesomeIcons.sort,
                            color: Colors.white),
                      )
                    ],
                  ),
                  //space
                  const SizedBox(height: 30),

                  //Categories
                  const BigText(text: "  Categories", fontSize: 18),

                  //tabs
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Column(
                              children: [
                                //Tabs
                                SizedBox(
                                  width: 150,
                                  height: 75,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: currentIndex == index
                                              ? const Color.fromARGB(
                                                  255, 72, 8, 246)
                                              : Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    margin: const EdgeInsets.only(
                                        top: 20, right: 20, bottom: 10),
                                    color: currentIndex == index
                                        ? Colors.white
                                        : Colors.grey[200],
                                    child: Center(
                                      child: BigText(
                                        text: tabs[index],
                                        fontSize:
                                            currentIndex == index ? 18 : 14,
                                        color: currentIndex == index
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),

                                //Visibility dot
                                Visibility(
                                    visible: currentIndex == index,
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Colors.deepPurple,
                                          shape: BoxShape.circle),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  //space
                  const SizedBox(height: 30),

                  //topplace + explore
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          BigText(text: "   Top places", fontSize: 18),
                          SizedBox(width: 5),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.deepOrangeAccent,
                          ),
                        ]),
                        Row(children: [
                          BigText(
                            text: "Explore",
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.deepOrangeAccent,
                            size: 15,
                          ),
                        ]),
                      ]),
                  //space
                  const SizedBox(height: 20),

                  //tabDetails
                  SizedBox(
                    height: 350,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                mainAxisExtent: 297),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return currentIndex == 0
                              ? TabDetails(
                                  img: hotelsData[index][0],
                                  name: hotelsData[index][1],
                                  location: hotelsData[index][2],
                                  price: hotelsData[index][3],
                                  review: hotelsData[index][4],
                                )
                              : currentIndex == 1
                                  ? TabDetails(
                                      img: tourismTabData[index][0],
                                      name: tourismTabData[index][1],
                                      location: tourismTabData[index][2],
                                      price: tourismTabData[index][3],
                                      review: tourismTabData[index][4])
                                  : currentIndex == 3
                                      ? TabDetails(
                                          img: homesTabData[index][0],
                                          name: homesTabData[index][1],
                                          location: homesTabData[index][2],
                                          price: homesTabData[index][3],
                                          review: homesTabData[index][4])
                                      : const Text("");
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
