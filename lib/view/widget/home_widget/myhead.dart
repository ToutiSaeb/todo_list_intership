import 'package:flutter/material.dart';
import 'package:todo_list/core/static/categories.dart';
import 'package:todo_list/view/widget/home_widget/customsearch.dart';

class Myhead extends StatefulWidget {
  final Function(String)? onDropdownChanged;
  final Function()? onTap;

  Myhead({super.key, this.onDropdownChanged, this.onTap});

  @override
  State<Myhead> createState() => _MyheadState();
}

class _MyheadState extends State<Myhead> {
  String? _selectedItem;
  final List<String> _dropdownItems = Categories.categories;

  @override
  void initState() {
    super.initState();
    _selectedItem = _dropdownItems.isNotEmpty ? _dropdownItems[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      flex: 6,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.1,
                    child: const Icon(Icons.person),
                  ),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: const Text(
                      "Welcome back Chad",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: screenWidth * 0.1,
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: Customsearch(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.1,
                    child: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: const Text(
                      "Your Notes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: screenWidth * 0.15,
                    child: IconButton(
                      onPressed: widget.onTap,
                      icon: const Icon(Icons.add, size: 25),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedItem,
                        iconSize: 0,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        dropdownColor: Colors.black,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue!;
                            if (widget.onDropdownChanged != null) {
                              widget.onDropdownChanged!(newValue);
                            }
                          });
                        },
                        items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selectedItem == value ? Color.fromARGB(255, 172, 233, 3): Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: Row(
                      children: [
                        Icon(Icons.qr_code),
                        SizedBox(width: 10),
                        Icon(Icons.menu),
                      ],
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
