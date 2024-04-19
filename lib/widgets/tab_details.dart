import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app_ui/pages/detail_screen.dart';
import 'package:travel_app_ui/widgets/big_text.dart';

class TabDetails extends StatelessWidget {
  final String img;
  final String name;
  final String location;
  final String price;
  final String review;
  const TabDetails(
      {super.key,
      required this.img,
      required this.name,
      required this.location,
      required this.price,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DetailPage(
          data: TabDetails(
              img: img,
              name: name,
              location: location,
              price: price,
              review: review),
        );
      })),
      child: Stack(
        children: [
          //outer container
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 255,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          //innner container\img
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover)),
            ),
          ),

          //column/ name etc
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: name, fontSize: 14),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      Iconsax.location,
                      size: 14,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Iconsax.star_1,
                      color: Colors.amber.shade700,
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      review,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_sharp,
                          size: 15,
                        ),
                        label: const Text(
                          "Book now",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                      height: 45,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 13),
                        child: Text(
                          "\$$price / night",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          //favoriteIcon
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 125),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
