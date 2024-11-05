import 'package:mongo_dart/mongo_dart.dart' as mongo;

class PetModel {
  final mongo.ObjectId id;
  final String name;
  final String type;

  PetModel({required this.id, required this.name, required this.type});

  Map<String, dynamic> toJson(){
    return{
      '_id': id,
      'name': name,
      'type': type,
    };
  }

  factory PetModel.fromJson(Map<String, dynamic> json){
    var id = json['_id'];
    if(id is String){
      try{
        id = mongo.ObjectId.fromHexString(id);
      }catch(e){
        id =  mongo.ObjectId();
        //throw ArgumentError('Formato de id invalido: $id');
      }
    } else if ( id is! mongo.ObjectId) {
      id = mongo.ObjectId();
    }
    return PetModel(
      id: id as mongo.ObjectId, 
      name: json['name'], 
      type: json['type'],
    );
  }

}