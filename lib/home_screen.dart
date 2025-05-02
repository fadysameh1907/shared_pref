import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  

  String myNameDef = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared pref'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter your name'
                ),
              ),
             const SizedBox(height: 20,),
             Text(
              myNameDef,
              style: TextStyle(
                fontSize: 30
              ),
             ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              saveData();
            },
             child: Text('Save'),
             ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              retriveData();
            },
             child: Text('Retrive'),
             ),
              const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              resetData();
            },
             child: Text('Reset'),
             ),
            ],
          ),
          ),
      ),
    );
  }
    void saveData() async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
        prefs.setString('name', nameController.text);
    });
  }
  void retriveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
          myNameDef = ( prefs.getString('name')?? '');
    });
  }
  void resetData() async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
         prefs.remove('name');
         retriveData();

     });

  }
}