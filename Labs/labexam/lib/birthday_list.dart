import 'package:flutter/material.dart';
import 'package:labexam/add_birthday.dart';

myList b1 = new myList('Kumar', 'May 8th', ' Friend');
myList b2 = new myList('Alice', 'November 29th', 'Family');
myList b3 = new myList('George', 'December 16th','Co-worker');
myList b4 = new myList('Carla', 'February 1st','Self');
List<myList> model = [b1, b2, b3, b4];

class myList extends BirthdayList{
  myList(String n, String d, String ty){
    this.name = n;
    this.date = d;
    this.type = ty;

  }
}

class BirthdayModel extends BirthdayList{




  Widget getAllBirthdays(){
    listBirthday = new ListView.builder
      (
        itemCount: model.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
              title: Text(model[index].date),
            leading: Text(model[index].name),
            subtitle: Text(model[index].type),

          );
        }
    );

  }

  Widget deleteAllBirthdays(){
    model.clear();
    listBirthday = new ListView.builder
      (
        itemCount: model.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(model[index].date),
            leading: Text(model[index].name),
            subtitle: Text(model[index].type),

          );
        }
    );
    return listBirthday;

  }


}
class BirthdayList extends StatelessWidget{
  String title;
  String name;
  String date;
  String type;
  ListView listBirthday;


  BirthdayList({String title}){
    this.title = title;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed:() {BirthdayModel().deleteAllBirthdays();
            // delete all birthdays, ()setState refresh State
            },
          ),
        ],
      ),
      body: BirthdayModel().getAllBirthdays(), //output the alright defined list of birthdays
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          myList newperson = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => addBirthday()
            ),
          );
          model.add(newperson);// get new person and add on to list
        },


        child: Icon(Icons.add),

      ),

    );
  }

}
