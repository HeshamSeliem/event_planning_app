
class TaskModel {
  String id;
  String title;
  String image;
  String descreption;
  int date;
  bool isDone;
  String? userId;
   
   TaskModel({
    this.id = "",
    required this.title,
    required this.image,
    required this.date,
    required this.descreption,
    this.isDone = false,
    required this.userId
   });
      TaskModel.fromJson(Map<String , dynamic> json) // this fun take map of string ,dynamic and return object
      : this( // this key word call the parameters of main class
        date: json["date"],
        id: json["id"],
        descreption: json["descreption"],
        image: json["image"],
        title: json["title"],
        isDone: json["isDone"],
        userId: json["userId"]
        );

      Map<String,dynamic> toJson(){ //this fun take object and return map
        return{
        "date": date,
        "id": id,
        "descreption": descreption,
        "image": image,
        "title": title,
        "isDone": isDone,
        "userId" :userId
        };
      }
}