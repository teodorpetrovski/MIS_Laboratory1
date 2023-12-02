import 'package:flutter/material.dart';

//Laboratory 1
//Teodor Petrovski
//Index: 201128

void main() {
  runApp(const MyApp());
}

class Subject {
  String name;

  Subject(this.name);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subject List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xff85cff5),
        useMaterial3: true
      ),
      home: const SubjectList(title: "Subject List App"),
    );
  }
}

class SubjectList extends StatefulWidget {
  const SubjectList({super.key,required this.title});

  final String title;

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  List<Subject> subjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff0574b0),
        title: const Text('201128',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(subjects[index].name,style: const TextStyle(fontSize: 23),),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            subjects.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addSubject();
              },
              child: const Text('Додади предмет',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );
  }

  void addSubject() {
    String subject = "";

     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Додади Предмет',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          content: TextField(
            onChanged: (value) {
              subject=value;
            },
            decoration: const InputDecoration(labelText: 'Предмет'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Откажи',style: TextStyle(fontSize: 20)),
            ),
            TextButton(
              onPressed: () {
                if (subject.isNotEmpty) {
                  Subject newSubject = Subject(subject);
                  setState(() {
                    subjects.add(newSubject);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Додади',style: TextStyle(fontSize: 20)),
            ),
          ],
        );
      },
    );
  }
}
