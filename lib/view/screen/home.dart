import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/crudcontroller.dart';
import 'package:todo_list/core/static/categories.dart';
import 'package:todo_list/view/screen/notes.dart';
import 'package:todo_list/view/widget/home_widget/myhead.dart';
import 'package:todo_list/view/widget/home_widget/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Categories.categories.length, vsync: this);
  }

  void _onDropdownChanged(String newValue) {
    setState(() {
      _tabController.index = Categories.categories.indexOf(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    CrudController controller = Get.put(CrudController());
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Spacer(flex: 1),
            // Head
            Myhead(
              onDropdownChanged: _onDropdownChanged,
              onTap: () {
                Get.to(Notes());
              },
            ),
            // Body
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  // Envelopper le TabBar avec un Container sans bordure
                  Container(
                    width: screenWidth, // Largeur de l'écran
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      tabs: List.generate(
                        Categories.categories.length,
                        (i) => Tab(
                          child: Container(
                            width: screenWidth / Categories.categories.length, // Largeur de chaque onglet
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: _tabController.index == i
                                  ? Color.fromARGB(255, 172, 233, 3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white, // Couleur de la bordure
                                width: 2, // Épaisseur de la bordure
                              ),
                            ),
                            child: Text(
                              Categories.categories[i],
                              style: TextStyle(
                                color: _tabController.index == i
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      indicator: BoxDecoration(
                        color: Colors.transparent, // La couleur de l'indicateur est transparente pour ne pas chevaucher
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: List.generate(
                        Categories.categories.length,
                        (i) => FutureBuilder<List<Map<String, dynamic>>>(
                          future: controller.getNotes(Categories.categories[i]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return const Center(child: Text('Error loading notes'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(child: Text('No notes found'));
                            } else {
                              List<Map<String, dynamic>> notes = snapshot.data!;
                              return ListView.builder(
                                itemCount: notes.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    shadowColor: Colors.black54,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(Settings(
                                          note: notes[index],
                                          category: Categories.categories[i],
                                        ));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    notes[index]['title'] ?? '',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20.0,
                                                      color: Color.fromARGB(255, 172, 233, 3),
                                                    ),
                                                  ),
                                                  Text(
                                                    notes[index]['body'] ?? '',
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  Text(
                                                    notes[index]['date'] ?? '',
                                                    style: TextStyle(color: Colors.grey[500]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: IconButton(
                                                onPressed: () async {
                                                  await controller.deleteNote(
                                                    Categories.categories[i],
                                                    notes[index]['title'] ?? '',
                                                  );
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.delete, color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
