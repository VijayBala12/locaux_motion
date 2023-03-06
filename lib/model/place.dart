import 'dart:ffi';
import 'package:flutter/material.dart';

class Place {
  String name;
  IconData? icon;
  List username;
  String price;
  DateTime userRatingDate;
  String address;
  double rating;
  int totalRatings;
  String placeImages;

  Place({required this.name, this.icon, required this.username, required this.price, required this.userRatingDate, required this.address, required this.rating, required this.totalRatings, required this.placeImages});

}

List places = [ Place(
  name: "Place Stanislas",
  username: ["Vijay", "Antoine", "Justine"], 
  price: "Gratuit", 
  userRatingDate: DateTime(2023, 3, 6), 
  address: "Place Stanislas, 54000 Nancy", 
  rating: 4.8, 
  totalRatings: 28047, 
  placeImages:"images/place_stanislas_2.jpg"),

  Place(
  name: "Parc de La Pépinière",
  username: ["John","Sam","Sophie"], 
  price: "Gratuit", 
  userRatingDate: DateTime(2023, 3, 6), 
  address: "Parc de la pepinière, 54000 Nancy", 
  rating: 4.5, 
  totalRatings: 10946, 
  placeImages:"images/parc_de_la_pepiniere_1.jpeg"),

  Place(
  name: "Musée de l'École de Nancy",
  username: ["François","Julien","Marie"], 
  price: "Gratuit", 
  userRatingDate: DateTime(2023, 3, 6), 
  address: "38 Rue Sergent Blandan, 54000 Nancy", 
  rating: 4.6, 
  totalRatings: 1362, 
  placeImages:"images/musee_de_nnancy_1.jpeg"),
  
  Place(
  name: "Basilique Saint-Epvre",
  username: ["Pierre","Thomas","Robin"], 
  price: "Gratuit", 
  userRatingDate: DateTime(2023, 3, 6), 
  address: "Pl. Saint-Epvre, 54000 Nancy", 
  rating: 4.4, 
  totalRatings: 930, 
  placeImages:"images/basilique_1.jpeg"),
  
  Place(
  name: "Porte de la Craffe",
  username: ["Romain","Mehdi","Florian"], 
  price: "Gratuit", 
  userRatingDate: DateTime(2023, 3, 6), 
  address: "Grande Rue 54000 Nancy", 
  rating: 4.7, 
  totalRatings: 920, 
  placeImages:"images/porte_de_la_craffe_1.jpeg"),
  
  ];
