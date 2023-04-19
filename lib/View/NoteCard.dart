import 'dart:io';

import 'package:advance_text_field/advance_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
import 'package:file_saver/file_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as Excel;


class NoteCard extends StatefulWidget {
  String code;
  int noteIndex;
  String name;
   NoteCard({Key? key,required this.code,required this.noteIndex, required this.name}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  Map<String, dynamic> dataBackEnd={};
  bool female = true;
  Note note = Note();
  Client client = Client();


  Future<void> generateExcel(AsyncSnapshot<QuerySnapshot> snapshot) async {

    clone(snapshot);
    // Map<String,dynamic> data=patient.originateData();
    int row = 1;
    int col = 1;
    //Create a Excel document.
    //Creating a workbook.
    final Excel.Workbook workbook = Excel.Workbook();
    //Accessing via index.
    final Excel.Worksheet sheet = workbook.worksheets[0];


    print("datatobackend ${dataBackEnd.keys}");
    // Set the text value.
    for (var title in dataBackEnd.keys) {
      print("title is $title");
      sheet.getRangeByIndex(row, col).setText(title);
      col++;
    }


    sheet.getRangeByIndex(row, col).setText("patient name");

    sheet.getRangeByIndex(2, col).setText(widget.name);

    row = row + 1;


    col = 1;
    for (String column in dataBackEnd.keys) {
      sheet
          .getRangeByIndex(row, col)
          .setText(dataBackEnd[column.toString()].toString() ?? "-");

      col++;
    }


    if (!kIsWeb) {
      if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
        bool status = await Permission.storage.isGranted;

        if (!status) await Permission.storage.request();
      }
    }

    showToast("note sheet saved succesfully");

    List<int> sheets = workbook.saveAsStream();

    workbook.dispose();
    Uint8List dataList = Uint8List.fromList(sheets);
    MimeType type = MimeType.MICROSOFTEXCEL;
    String path = await FileSaver.instance
        .saveAs("note ${widget.noteIndex} - ${widget.code}", dataList, "xlsx", type);
    print(path);
  }


  void save(Map<String, dynamic> dataBackEnd,
      AsyncSnapshot<QuerySnapshot> snapshot) async {
    if (snapshot.data!.docs
        .where((element) =>
    element['user'] == client.token && element['hCode'] == widget.code && element['noteIndex']==widget.noteIndex)
        .isEmpty) {
      print("new time ${widget.code}");
      FirebaseFirestore.instance
          .collection(NotesSheetKeys.table)
          .add(dataBackEnd);
    } else {
      var checkedValue = snapshot.data?.docs.firstWhere((element) =>
      element['user'] == client.token && element['hCode'] == widget.code && element['noteIndex']==widget.noteIndex);
      await FirebaseFirestore.instance
          .collection(NotesSheetKeys.table)
          .doc(checkedValue?.reference.id)
          .update(dataBackEnd);
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

    dataBackEnd.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataBackEnd.putIfAbsent("hCode", () => widget.code);
    dataBackEnd.putIfAbsent("noteIndex", () => widget.noteIndex);
    dataBackEnd.putIfAbsent("date", () => note.date);
    dataBackEnd.putIfAbsent("note", () => note.note);


    save(dataBackEnd, snapshot);
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
          dataBackEnd = checkedValue!.isEmpty
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
                              FloatingActionButton(
                                // label: const Text(
                                //   'Save',
                                //   style: TextStyle(color: Colors.white),
                                // ), // <-- Text
                                backgroundColor: Colors.grey.shade600,
                                child: const Icon(
                                  // <-- Icon
                                  Icons.print,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  final ConfirmAction action =
                                  (await _asyncConfirmDialog(context))!;

                                  if (action == ConfirmAction.Accept) {
                                    await generateExcel(snapshot);
                                  }
                                },
                              ),
                              SizedBox(height: 15,),

                              Text(
                                "Date: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AdvanceTextField(
                                text: dataBackEnd['date'],
                                animationDuration:
                                Duration(milliseconds: 200),
                                backgroundColor: Colors.blue.shade900,
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
                                    color: Colors.blue.shade900,
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
                                          color: Colors.blue.shade900,
                                          width: 2),
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade900,
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
enum ConfirmAction { Cancel, Accept }

Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Generating excel sheet'),
        content: const Text(
            'This will generate excel sheet for notes sheet of patient'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Accept'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
