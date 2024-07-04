// ignore_for_file: deprecated_member_use

import 'package:bloc_task/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddResponseScreen extends StatefulWidget {
  final SearchBloc searchBloc;
  const AddResponseScreen({required this.searchBloc, super.key});

  @override
  State<AddResponseScreen> createState() => _AddResponseScreenState();
}

class _AddResponseScreenState extends State<AddResponseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nodeIdController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _nodeIdController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Add response'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaQuery.height * .02,
                ),
                Text(
                  "Fill the form for data entry",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width * .05),
                ),
                SizedBox(
                  height: mediaQuery.height * .05,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15),
                              prefixIcon: const Icon(
                                Icons.person,
                              ),
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38),
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(height: mediaQuery.height * .02),
                        TextFormField(
                          controller: _nodeIdController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Node ID';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                              ),
                              hintText: "Node Id",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38),
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(height: mediaQuery.height * .02),
                        TextFormField(
                          controller: _fullNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Full Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              prefixIcon: const Icon(
                                Icons.people,
                              ),
                              hintText: "Full Name",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38),
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(height: mediaQuery.height * .04),
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                widget.searchBloc.add(AddResponseInSearch(
                                  fullName: _fullNameController.text,
                                  name: _nameController.text,
                                  nodeId: _nodeIdController.text,
                                ));
                                Navigator.of(context).pop();
                              }
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width * .11,
                                      vertical: mediaQuery.height * .015)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple[300]),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: mediaQuery.width * .04),
                                  )),
                        SizedBox(height: mediaQuery.height * .04),
                      ],
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
