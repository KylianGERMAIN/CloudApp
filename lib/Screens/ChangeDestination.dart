import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/ManageCity.dart';
import 'package:intl/intl.dart';

class ChangeDestination extends StatelessWidget {
  const ChangeDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderManageCity providerManageCity =
        Provider.of<ProviderManageCity>(context, listen: true);
    List<String> tbl = providerManageCity.getlistCity;

    late TextEditingController _controller = TextEditingController();

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(108, 172, 199, 1),
            Color.fromRGBO(183, 229, 247, 1),
          ],
        )),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Row(children: [
              Flexible(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 20),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'What city do you want ?',
                        ),
                      ))),
              Padding(
                  padding: EdgeInsets.only(top: 10, right: 10, bottom: 20),
                  child: Container(
                      color: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        color: Colors.white,
                        onPressed: () {
                          providerManageCity.addcity(_controller.text);
                          FocusScope.of(context).unfocus();
                        },
                      ))),
            ]),
            Expanded(
                child: ListView.builder(
                    itemCount: providerManageCity.getlistCity.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: GestureDetector(
                        onTap: () {
                          providerManageCity.manageCity(index);
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          providerManageCity.getlistCity[index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  providerManageCity.getActualCity == index
                                      ? const SizedBox()
                                      : IconButton(
                                          icon: const Icon(Icons.close_rounded,
                                              color: Colors.red),
                                          color: Colors.white,
                                          onPressed: () {
                                            providerManageCity
                                                .removeCity(index);
                                          },
                                        ),
                                ])),
                      ));
                    }))
          ]),
        ));
  }
}
