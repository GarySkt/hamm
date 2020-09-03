import 'package:flutter/material.dart';
import 'package:hamm/database/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TaskDataBase db = TaskDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "Mis Cuentas",
              style: TextStyle(fontSize: 40.0),
            ),
            FutureBuilder(
                future: db.initDB(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _showList(context);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _showList(BuildContext context) {
    return FutureBuilder(
        future: db.getAllTasks(),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                for (Task task in snapshot.data)
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(task.name),
                        )
                      ],
                    ),
                  ),
              ],
            );
          } else {
            return Center(
              child: Text("Aun no tienes cuentas :O"),
            );
          }
        });
  }

  _addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              TextField(
                onSubmitted: (text) {
                  setState(() {
                    var task = Task(text);
                    db.insert(task);
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }
}
