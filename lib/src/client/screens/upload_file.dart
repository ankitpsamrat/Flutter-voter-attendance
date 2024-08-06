import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../helpers/responsive.dart';
import '../../common/custom_button.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  //

  File? _selectedFile;
  String _selectedValue = 'Booth 1';
  final List<String> _dropdownItems = ['Booth 1', 'Booth 2', 'Booth 3'];

  String _selectedRadio = 'Option 1';

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload & Download'),
      ),
      body: Column(
        children: [
          const Divider(),
          const SizedBox(height: 40),
          const Text(
            'Upload Data',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: (_selectedFile == null)
                ? CustomButton(
                    title: 'Upload excel',
                    onTap: () async {
                      final FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        setState(() {
                          _selectedFile = File(result.files.single.path!);
                        });
                      }
                    },
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: (_selectedFile != null),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _selectedFile!.path.split('/').last,
                              style: TextStyle(
                                fontSize: 12 * AppUI.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedFile = null;
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: (_selectedFile != null),
                        child: CustomButton(
                          title: 'Submit',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
          ),
          const Divider(),
          const SizedBox(height: 40),
          const Text(
            'Download attendance',
            style: TextStyle(fontSize: 22),
          ),
          DropdownButton<String>(
            value: _selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue!;
              });
            },
            items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Row(
            children: [
              SizedBox(
                width: 50 * AppUI.dw,
                child: ListTile(
                  title: const Text('Pending'),
                  leading: Radio<String>(
                    value: 'Option 1',
                    groupValue: _selectedRadio,
                    onChanged: _handleRadioValueChange,
                  ),
                ),
              ),
              SizedBox(
                width: 50 * AppUI.dw,
                child: ListTile(
                  title: const Text('Attended'),
                  leading: Radio<String>(
                    value: 'Option 2',
                    groupValue: _selectedRadio,
                    onChanged: _handleRadioValueChange,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              title: 'Download excel',
              onTap: () async {
                final FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  setState(() {
                    _selectedFile = File(result.files.single.path!);
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
