import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/models/task_model.dart';

class FirebaseManager{
 
  static CollectionReference<TaskModel> getTaskCollection(){
    return FirebaseFirestore.instance.collection("Tasks").
    withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!); //fromfirestore takes map and return model 
      },
       toFirestore: (model, _) {
         return model.toJson();
       },)
       ;

   }

 static Future<void> addEvent(TaskModel task)
  {
    var collection = getTaskCollection();    // i enhanced my code with the gettaskcolle to refactor it to avoid multi implement of it and i stored it in var called collection 
     // now i want to create new document and set itis id as my id 
     var docRev = collection.doc(); //now create new document 
     task.id = docRev.id;  // here i set the doc id to the task id
     return docRev.set(task); // i tell him to set this task which i pass to it
  }
  static Stream<QuerySnapshot<TaskModel>> getEvent()
  {
    var collection = getTaskCollection();
    return collection.orderBy("date").snapshots();
  }

  static Future<void>deleteEvent(String id)//the return type is future<void>
  {
    var collection = getTaskCollection(); // first i hols the collection 
    return collection.doc(id).delete();// secend i go to the document depending on it is id and delete it
  }
                
}