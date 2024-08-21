import 'package:flutter/material.dart';

class Customsearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
return[

];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){}, icon: Icon(Icons.backpack_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("done");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return Text("suggestion");
  }
  
}