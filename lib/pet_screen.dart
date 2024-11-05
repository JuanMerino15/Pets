
import 'package:crud_mongodb/mongobd.dart';
import 'package:crud_mongodb/pet_model.dart';
import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart' as mongo;

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  List<PetModel> pets = [];

  @override
  void initState() {
    super.initState();
    _fetchPets();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchPets() async {
    pets = await MongoService().getPets();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MongoDB Crud'),
      ),
      body: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                var pet = pets[index];
                return ListTile(
                  title: Text(pet.name),
                  subtitle: Text(pet.type),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
                    ],
                  ),
                );
              },
            ),
          );
    
  }
}