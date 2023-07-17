import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collection_of_recipes_flutter_app/models/recipesmodels.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String? data;

  List<recipes> recipe = [];

  Future<void> loadJSON() async {
    data = await rootBundle.loadString("assets/recipes.json");

    setState(() {
      List decodeList = jsonDecode(data!);

      recipe = decodeList.map((e) => recipes.fromMap(data: e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Recipes App")),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: (recipe.isEmpty)
          ? Column(
              children: [
                Center(
                  child: Container(
                    child: Text("No data Available",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                ),
                CircularProgressIndicator(),
              ],
            )
          : ListView.builder(
              itemCount: recipe.length,
              itemBuilder: (context, i) => Card(
                color: Colors.white24,
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ListTile(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, 'introscreens');
                      },
                        leading: CircleAvatar(
                          radius: 70,
                          foregroundImage:
                              NetworkImage("${recipe[i].imageURL}"),
                        ),
                        title: Text("${recipe[i].name}"),
                        subtitle: Text("${recipe[i].steps}")),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
