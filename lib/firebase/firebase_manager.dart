import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/models/task_model.dart';
import 'package:event_planning_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
   // this function is to create new collection called users as a usertype model
   static CollectionReference<UserModel> getUserCollection(){
    return FirebaseFirestore.instance.collection("Users").
    withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!); //fromfirestore takes map and return model 
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

  static Future<void> addUser(UserModel user)
  {
    var collection = getUserCollection();    // i enhanced my code with the gettaskcolle to refactor it to avoid multi implement of it and i stored it in var called collection 
     // now i want to create new document and set itis id as my id 
     var docRev = collection.doc(user.id); //now create new document 
     // i set the id to task to find the user and search about him using id
     return docRev.set(user); // i tell him to set this task which i pass to it
  }
  static Stream<QuerySnapshot<TaskModel>> getEvent(String categoryName)
  {
    var collection = getTaskCollection();
    if(categoryName == "all")
    {
       return collection
    .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .orderBy("date").snapshots();
    }
    else
    {
      return collection
    .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .where("category", isEqualTo: categoryName)
    .orderBy("date").snapshots();
    }
    
  }
   static Future<UserModel?> readUser()async
   {
      var collection = getUserCollection(); 
     DocumentSnapshot<UserModel> docRev = await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
     return docRev.data();
   }

  static Future<void>deleteEvent(String id)//the return type is future<void>
  {
    var collection = getTaskCollection(); // first i hols the collection 
    return collection.doc(id).delete();// secend i go to the document depending on it is id and delete it
  }
  // this fnction related to auth you will find it on flutter fire
  // on this link https://firebase.flutter.dev/docs/auth/password-auth/
  static Future<void> createAccount(String emailAddress , String password,String name,
   Function onLoading , Function onSuccess , Function onError 
   )async{
     try {
      onLoading();
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
     credential.user!.sendEmailVerification(); // with this line i can send verivication email to verify it
     UserModel userModel = UserModel(
      id: credential.user!.uid,
       name: name,
        email: emailAddress,
         createdAt: DateTime.now().millisecondsSinceEpoch
         );
     addUser(userModel);
    onSuccess();
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') { // on this catch i check about the error as a type of these three types
    onError(e.message);
  } else if (e.code == 'email-already-in-use') {
    onError(e.message);
  }
} catch (e) {
  onError("some thing went wrong");
  print(e);
}
 
  }

 static Future<void> logIn(
  String emailAddress,
  String password,
   Function onLoading , Function onSuccess , Function onError 
 )async{
    try {
      onLoading();
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
  //if(credential.user!.emailVerified)
  // {
    onSuccess();
  // }
  // else{
  //   onError("please verify your email");
  // }
} on FirebaseAuthException catch (e) {
  onError(e.message);
}
  }
  static Future<void> logOut()async
  {
   await FirebaseAuth.instance.signOut();
  }
                
}