import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locaux_motion/model/place.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  static const green = Color.fromARGB(255, 0, 94, 85);

  @override
  Widget build(BuildContext context) {
    Place place = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: titleWidget(),
                ),
                optionsWidget(),
                const SizedBox(height: 30,),
                ratingWidget(),
                const SizedBox(height: 30,),
                imagesWidget(),
                const SizedBox(height: 30,),
                Text("Avis"),
                const SizedBox(height: 30,),
                commentsWidget(),
                Text("Billets"),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.local_attraction, color: green),
                    ),
                    Text(place.name),
                    Spacer(),
                    Text(place.price)
                  ],
                ),
                Divider(),
                const SizedBox(height: 10,),
                Text("Adresse"),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.location_city_rounded, color: green),
                    ),
                    Text(place.address),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleWidget() {
    Place place = Get.arguments;
    return Row(
      children: [
        Text(place.name, style: const TextStyle(fontWeight: FontWeight.bold),),
        const Spacer(),
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_outlined, color: Colors.red,)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, color: green,))
      ],
    );
  }
  
  Widget optionsWidget() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.format_list_numbered_outlined, color: green,),
              SizedBox(width: 4,),
              Text("À visiter")
            ],
          ),
          Spacer(),
          VerticalDivider(thickness: 0.5, color: Colors.black87,),
          Spacer(),
          InkWell(
            onTap: (){
              Get.close(1);
            },
            child: Row(
              children: const [
                Icon(Icons.cases_rounded, color: green,),
                SizedBox(width: 8,),
                Text("Ajouter à \nun voyage")
              ],
            ),
          ),
          Spacer(),
          VerticalDivider(thickness: 0.5, color: Colors.black87,),
          Spacer(),
          Row(
            children: const [
              Icon(Icons.directions, color: green,),
              SizedBox(width: 4,),
              Text("Y aller")
            ],
          ),
        ],
      ),
    );
  }

  Widget ratingWidget() {
    Place place = Get.arguments;
    return Row(
        children: [
          Text(place.rating.toString()),
          SizedBox(width: 10,),
          SmoothStarRating(
              allowHalfRating: false,
              starCount: 5,
              rating: place.rating,
              size: 20.0,
              color: Colors.amber,
              borderColor: Colors.amber,
              spacing:0.0
          ),
          SizedBox(width: 10,),
          Text("(${place.totalRatings})"),
        ],
    );
  }

  Widget imagesWidget() {
    Place place = Get.arguments;
    return  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
        width: Get.width,
        height: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(place.placeImages.first)),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget commentsWidget() {
    Place place = Get.arguments;
    List<Widget> widgets = List.empty(growable: true);
    place.comments?.forEach((element) {
      widgets.add(ListTile(
        leading: const Icon(Icons.person, color: green,),
        title: Text(element.username ?? ""),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmoothStarRating(
                allowHalfRating: false,
                starCount: 5,
                rating: element.rating ?? 0,
                size: 20.0,
                color: Colors.amber,
                borderColor: Colors.amber,
                spacing:0.0
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(element.commentDate),
            )
          ],
        )
      ));
      widgets.add(Divider());
    });
    return Column(
      children: widgets
    );
  }
}
