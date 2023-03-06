import 'dart:ffi';
import 'dart:html';
import 'package:flutter/material.dart';

class Place {
  String name;
  String price;
  String address;
  double rating;
  int totalRatings;
  List<String> placeImages;
  List<Comment>? comments;

  Place({required this.name, required this.price, this.comments, required this.address, required this.rating, required this.totalRatings, required this.placeImages});
}

class Comment{
  String username;
  double rating;
  DateTime commentDate;

  Comment({required this.username, required this.rating, required this.commentDate});
}

List<Place> places = [ Place(
  name: "Place Stanislas",
  comments: [
    Comment(
      username: "Vijay",
      rating: 5.0,
      commentDate: DateTime(2023, 3, 6)
    )
  ],
  price: "Gratuit",
  address: "Place Stanislas, 54000 Nancy", 
  rating: 4.8, 
  totalRatings: 28047, 
  placeImages:["images/place_stanislas_2.jpg"]),

  Place(
  name: "Parc de La Pépinière",
  price: "Gratuit",
  address: "Parc de la pepinière, 54000 Nancy", 
  rating: 4.5, 
  totalRatings: 10946, 
  placeImages:["images/parc_de_la_pepiniere_1.jpeg"]),

  Place(
  name: "Musée de l'École de Nancy",
  price: "Gratuit",
  address: "38 Rue Sergent Blandan, 54000 Nancy", 
  rating: 4.6, 
  totalRatings: 1362, 
  placeImages:["images/musee_de_nnancy_1.jpeg"]),
  
  Place(
  name: "Basilique Saint-Epvre",
  price: "Gratuit",
  address: "Pl. Saint-Epvre, 54000 Nancy", 
  rating: 4.4, 
  totalRatings: 930, 
  placeImages:["images/basilique_1.jpeg"]),
  
  Place(
  name: "Porte de la Craffe",
  price: "Gratuit",
  address: "Grande Rue 54000 Nancy", 
  rating: 4.7, 
  totalRatings: 920, 
  placeImages:["images/porte_de_la_craffe_1.jpeg"]),
  ];
