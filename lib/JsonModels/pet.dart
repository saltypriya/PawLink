import 'dart:convert';

class Pet {
  int? petId;
  String petName;
  String species;
  String breed;
  int age;
  String gender;
  String color;
  double weight;
  String healthIssues;
  String medications;
  String feedingInstructions;
  String exerciseNeeds;
  String groomingRequirements;
  String microchipId;

  Pet({
    this.petId,
    required this.petName,
    required this.species,
    required this.breed,
    required this.age,
    required this.gender,
    required this.color,
    required this.weight,
    required this.healthIssues,
    required this.medications,
    required this.feedingInstructions,
    required this.exerciseNeeds,
    required this.groomingRequirements,
    required this.microchipId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    petId: json['petId'],
    petName: json['petName'],
    species: json['species'],
    breed: json['breed'],
    age: json['age'],
    gender: json['gender'],
    color: json['color'],
    weight: json['weight'],
    healthIssues: json['healthIssues'],
    medications: json['medications'],
    feedingInstructions: json['feedingInstructions'],
    exerciseNeeds: json['exerciseNeeds'],
    groomingRequirements: json['groomingRequirements'],
    microchipId: json['microchipId'],
  );

  Map<String, dynamic> toMap() {
    return {
      'petName': petName,
      'species': species,
      'breed': breed,
      'age': age,
      'gender': gender,
      'color': color,
      'weight': weight,
      'healthIssues': healthIssues,
      'medications': medications,
      'feedingInstructions': feedingInstructions,
      'exerciseNeeds': exerciseNeeds,
      'groomingRequirements': groomingRequirements,
      'microchipId': microchipId,
    };
  }

  String toJson() => json.encode(toMap());
}
