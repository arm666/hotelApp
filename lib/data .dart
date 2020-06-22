import 'package:flutter/cupertino.dart';

List hotel_detail = [
  {
    "name": "Hotel Yak & Yeti",
    "place": "kathmandu",
    "price": "Rs. 22,868",
    "image": "assets/images/HotelYak&Yeti.jpg",
    "stars": 4,
    "reviews": "1,614",
    "location": "Durbar Marg, Kathmandu 44600 Nepal",
    "description":
        "Hotel Yak and Yeti, is a luxury 5-star deluxe hotel in the heart of Kathmandu, Nepal. Modern day sophistication greets cultural heritage in the ample grounds of the 100-year-old palace and newly designed structure of the hotel. Find refuge among antique fountains, gilded temples and emerald gardens as you remain just moments away from all the shops and adventure of the Kathmandu city, located at Durbar Marg, Kathmandu, Nepal."
  },
  {
    "name": "Shangrila Village Resort",
    "place": "Kaski",
    "price": "Rs. 15,313",
    "image": "assets/images/Shangrila.jpg",
    "stars": 4,
    "reviews": "355",
    "location": "Gharipatan, Pokhara 33411 Nepal",
    "description":
        "Set admist peaceful surrounding, 5 min drive from airport and 7 min from Lake side commands a breathtaking mountain views. Walk, relax, dream, because Shangrila Village resort is what dreams are made of- Nepal own “Simply Heaven”."
  },
  {
    "name": "Rhino lodge & Hotel",
    "place": "Chitwan",
    "price": "Rs. 974",
    "image": "assets/images/Rhinolodge&Hotel.jpg",
    "stars": 5,
    "reviews": "153",
    "location": "Birauta Chowk, Pardi, Pokhara Nepal",
    "description":
        "Rhino Lodge & Hotel, a three-star hotel in Sauraha, Chitwan near Chitwan national park is known as one of the best and affordable hotels in Sauraha, Chitwan. We offer deluxe accommodation, various jungle safari, tour packages, cultural programs, and hospitality services for a long time. We have a variety of rooms at the lowest prices which is not only affordable but worthy too."
  },
  {
    "name": "Hotel Pokhara Grande",
    "place": "Kaski",
    "price": "Rs. 13,802",
    "image": "assets/images/PokharaGrande.jpg",
    "stars": 5,
    "reviews": "543",
    "location": "Birauta Chowk, Pardi, Pokhara Nepal",
    "description":
        "Pokhara Grande is a 5 minute's drive from the stunning Fewa Lake and ideally located amidst the panoramic view of Annapurna Range and Fishtail mountains. The hotel is a perfect base for business travelers, topnotch trekkers and for visitors who want to explore the unrivaled attractions of Pokhara."
  },
  {
    "name": "Begnas Lake Resort",
    "place": "Kaski",
    "price": "Rs. 12,685",
    "image": "assets/images/Begnas.jpg",
    "stars": 5,
    "reviews": "229",
    "location": "Sundari Danda, Begnas Lake, Pokhara 33411 Nepal",
    "description":
        "Welcome to Begnas Lake Resort, your Pokhara “home away from home.” Begnas Lake Resort aims to make your visit as relaxing and enjoyable as possible, which is why so many guests continue to come back year after year."
  }
];

final List facility = [
  Features("Property Amenitiies", propertyAmenitities),
  Features("Room features", roomFeatures),
  Features("Room Types", roomTypes)
];

class Features {
  final title;
  final List content;
  Features(this.title, final  this.content);
}

final List propertyAmenitities = [
  "Free Parking",
  "Free High Speed Internet",
  "Pool",
  "Fitness Center with Gym / Workout",
  "Bar / Lounge"
];
final List roomFeatures = [
  "Allergy-free room",
  "Blackout curtains",
  "Air conditioning",
  "Coffee / Tea maker ",
  "Cable / Satellite TV"
];
final List roomTypes = [
  "Non-smoking rooms",
  "Family rooms",
  "Smoking rooms available"
];
