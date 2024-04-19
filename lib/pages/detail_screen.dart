import 'package:flutter/material.dart';
import 'package:travel_app_ui/pages/home_page.dart';
import 'package:travel_app_ui/widgets/tab_details.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});
  final TabDetails data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    //img
                    Positioned(
                        left: 10,
                        right: 10,
                        bottom: 0,
                        top: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            data.img,
                            fit: BoxFit.cover,
                          ),
                        )),

                    //custom appBar
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const HomePage();
                                  })),
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.white)),
                          const Icon(Icons.favorite_border_outlined,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
