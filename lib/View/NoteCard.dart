import 'package:advance_text_field/advance_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gppsupporters/DatabaseUtils/NotesSheetKeys.dart';
import 'package:gppsupporters/DatabaseUtils/NotesSheetKeys.dart';
import 'package:gppsupporters/Model/Patient.dart';

import '../DatabaseUtils/ADMSheetKeys.dart';
import '../DatabaseUtils/LabSheetKeys.dart';
import '../Model/Client.dart';
import '../Model/Note.dart';
import 'ProfileScreen.dart';

class NoteCard extends StatefulWidget {
  String code;
  int noteIndex;
   NoteCard({Key? key,required this.code,required this.noteIndex}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  Map<String, dynamic> dataBackEnd={};
  bool female = true;
  Note note = Note();
  Client client = Client();

  void save(Map<String, dynamic> dataToBackend,
      AsyncSnapshot<QuerySnapshot> snapshot) async {
    if (snapshot.data!.docs
        .where((element) =>
    element['user'] == client.token && element['hCode'] == widget.code && element['noteIndex']==widget.noteIndex)
        .isEmpty) {
      print("new time ${widget.code}");
      FirebaseFirestore.instance
          .collection(NotesSheetKeys.table)
          .add(dataToBackend);
    } else {
      var checkedValue = snapshot.data?.docs.firstWhere((element) =>
      element['user'] == client.token && element['hCode'] == widget.code && element['noteIndex']==widget.noteIndex);
      await FirebaseFirestore.instance
          .collection(NotesSheetKeys.table)
          .doc(checkedValue?.reference.id)
          .update(dataToBackend);
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void clone(AsyncSnapshot<QuerySnapshot> snapshot) {

    Map<String, dynamic> dataToBackend = {};
    dataToBackend.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataToBackend.putIfAbsent("hCode", () => widget.code);
    dataToBackend.putIfAbsent("noteIndex", () => widget.noteIndex);
    dataToBackend.putIfAbsent("date", () => note.date);
    dataToBackend.putIfAbsent("note", () => note.note);


    save(dataToBackend, snapshot);
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(NotesSheetKeys.table)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var checkedValue = snapshot.data?.docs.where((element) =>
          element['user'] == client.token &&
              element['hCode'] == ProfileScreen.code && element['noteIndex']==widget.noteIndex);
          Map<String, dynamic> dataBackEnd = checkedValue!.isEmpty
              ? Map()
              : checkedValue.first.data() as Map<String, dynamic>;
          note.cloneData(dataBackEnd);
          return Card(
            elevation: 10,
            child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                          color: Colors.grey.shade300, width: 1.2)),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.6,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          Column(
                            children: [
                              SizedBox(height: 15,),
                              Text(
                                "Date: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AdvanceTextField(
                                text: dataBackEnd['date'],
                                animationDuration:
                                Duration(milliseconds: 200),
                                backgroundColor: Colors.indigo.shade900,
                                type: AdvanceTextFieldType.EDIT,
                                keyboardType: TextInputType.number,
                                editLabel: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                saveLabel: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                textHint: 'enter date',
                                onEditTap: () {},
                                onSaveTap: (text) {
                                  note.date = text;
                                },
                              ),

                            ],
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            children: [
                              Text(
                                "Note: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                textAlign: TextAlign.center,

                                onChanged: (query) {
                                  note.note = query;
                                },

                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                //Normal textInputField will be displayed
                                maxLines: 15,
                                // when user presses enter it will adapt to it
                                // controller: _controller,
                                decoration: InputDecoration(

                                    label: note.note != null
                                        ? Center(
                                      child: Text(note.note!),
                                    )
                                        : null,

                                    alignLabelWithHint: true,

                                    // suffixIconColor: Colors.white,
                                    hintText: 'enter note',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets
                                        .symmetric(
                                        vertical: 60.0, horizontal: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                          color: Colors.indigo.shade900,
                                          width: 2),
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                          color: Colors.indigo.shade900,
                                          width: 2),
                                    )),
                              ),

                              const SizedBox(height: 25,),
                              FloatingActionButton.extended(
                                label: const Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ), // <-- Text
                                backgroundColor: Colors.green.shade900,
                                icon: const Icon(
                                  // <-- Icon
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  clone(snapshot);
                                },
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
          );

        });

  }
}
