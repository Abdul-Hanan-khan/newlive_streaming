import 'package:flutter/material.dart';
import 'package:newlive_streaming/ChatingModule/chatUser.dart';
import 'package:newlive_streaming/widget/conversationList.dart';

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel",messageText:"vnjjk",
        imageURL: "https://media.istockphoto.com/photos/portrait-of-beard-african-american-professional-cameraman-with-in-picture-id1312002976"
        ,time: "Now"),
    ChatUsers(name: "Glady's Murphy",messageText: "the app",
        imageURL:"https://images.unsplash.com/photo-1556157382-97eda2d62296?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8eW91bmclMjBwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        time: "Yesterday"),
    ChatUsers(name: "Jorge Henry",messageText:"bdvhjsb",
        imageURL: "https://images.unsplash.com/photo-1580894732444-8ecded7900cd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8eW91bmclMjBwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        time: "31 Mar"),
    ChatUsers(name: "Philip Fox",messageText: "dbvhjr",
        imageURL: "https://media.istockphoto.com/photos/beautiful-smiling-african-ethnicity-businesswoman-picture-id1300304411?b=1&k=20&m=1300304411&s=170667a&w=0&h=7K4_MgZl5jfWL_JD5tF4ZiMVuSqS3MI5nA4TFeTeGa4=",
        time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins",messageText: "bhjbvj",
        imageURL: "https://thumbs.dreamstime.com/z/hipster-girl-using-smartphone-full-length-portrait-beautiful-social-networking-her-smiling-50879044.jpg",
        time: "23 Mar"),
    ChatUsers(name: "Jacob Pena",messageText: "ncjksb",
        imageURL: "https://media.istockphoto.com/photos/portrait-of-beard-african-american-professional-cameraman-with-in-picture-id1312002976",
        time: "17 Mar"),
    ChatUsers(name: "Andrey Jones",messageText: "ndvjdr",
        imageURL:  "https://thumbs.dreamstime.com/z/young-pretty-girl-networking-laptop-computer-17717216.jpg",
        time: "24 Feb"),
    ChatUsers(name: "John Wick",messageText: "bvjhdrvbjh" ,
        imageURL: "https://thumbs.dreamstime.com/z/young-pretty-girl-networking-laptop-computer-17717216.jpg",
        time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Conversations", style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),),
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add, color: Colors.pink, size: 20,),
                            SizedBox(width: 2,),
                            Text("Add New", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.grey.shade100
                        )
                    ),
                  ),
                ),
              ),

          ListView.builder(
           itemCount: chatUsers.length,
           shrinkWrap: true,
           padding: EdgeInsets.only(top: 16),
           physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
          return ConversationList(
          name: chatUsers[index].name,
          messageText: chatUsers[index].messageText,
          imageUrl: chatUsers[index].imageURL,
          time: chatUsers[index].time,
          isMessageRead: (index == 0 || index == 3) ? true : false,
     );
    },
    ),
            ],
          ),
        ),
      );
  }}