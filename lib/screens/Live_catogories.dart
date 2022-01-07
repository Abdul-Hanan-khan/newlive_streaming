import 'dart:io';


import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Live_Catogories extends StatefulWidget {
  String catgoryname;
Live_Catogories({Key key, this.catgoryname}) : super(key: key);

  @override
  _Live_CatogoriesState createState() => _Live_CatogoriesState();
}

class _Live_CatogoriesState extends State<Live_Catogories> {
 var imagesLink=[
   "https://media.istockphoto.com/photos/portrait-of-beard-african-american-professional-cameraman-with-in-picture-id1312002976",
   "https://images.unsplash.com/photo-1556157382-97eda2d62296?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8eW91bmclMjBwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
   "https://images.unsplash.com/photo-1580894732444-8ecded7900cd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8eW91bmclMjBwcm9mZXNzaW9uYWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
   "https://media.istockphoto.com/photos/beautiful-smiling-african-ethnicity-businesswoman-picture-id1300304411?b=1&k=20&m=1300304411&s=170667a&w=0&h=7K4_MgZl5jfWL_JD5tF4ZiMVuSqS3MI5nA4TFeTeGa4=",
   "https://thumbs.dreamstime.com/z/hipster-girl-using-smartphone-full-length-portrait-beautiful-social-networking-her-smiling-50879044.jpg",
   "https://thumbs.dreamstime.com/z/young-pretty-girl-networking-laptop-computer-17717216.jpg",
 ];
  DatePickerController _controller = DatePickerController();
   var days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
   var SelectedDate="";
   var day = DateTime.parse('2020-09-12').weekday;
  var date = DateFormat('d/M/yyyy');
//  var days = DateFormat.EEEE(Platform.localeName).dateSymbols.WEEKDAYS;
  DateTime _selectedValue = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String yearselect="";

  initState(){
    setState(() {
      SelectedDate=days[day];
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.black,
        body:Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image:  DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage('assets/icons/screenBack.PNG'),
              fit: BoxFit.fill,

            ),
          ),
    child: Column(
      children: [
        Container(
          height: 200,
          color: Colors.black.withOpacity(0.5),
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: [

              Column(
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                      ),
                      Icon(Icons.search,color: Colors.white,size: 30,),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffffffff),
                    child:CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage:AssetImage("assets/icons/testimage.jpg",),

                    ),
                    ),
                  ),
                 ]

              ),
              SizedBox(height: 40,),
              Center(child: Text("${widget.catgoryname}",style: TextStyle(fontSize: 22,color: Colors.cyanAccent,fontWeight: FontWeight.w800),),)

            ],
          ),
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          child:
          ListView.builder(
            scrollDirection: Axis.horizontal,
                      itemCount: 7,
                        itemBuilder: (context,items){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                SelectedDate=days[items];
                              });

                            },
                            child: Card(

                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.13,
                              child: Container(
                                  child: Text(days[items],style: TextStyle(
                                      fontSize: 18,color:days[items]==SelectedDate?Colors.purple:Colors.white54
                                      ,fontWeight: FontWeight.w800),)),
                              ),
                            ),
                          );
                        }),
                      ),
                          Container(
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                               //   color: Colors.blue,
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Color(0xff2059bb),
                                    child:CircleAvatar(
                                    radius: (index==1||index==3)?30:35,
                                    backgroundColor: Colors.white,
                                    backgroundImage:NetworkImage("${imagesLink[index]}")
                                    )
                                    ),

                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                  ],
                 ),
                )
              );
          }
        }
