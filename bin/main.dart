import 'dart:io';

import 'package:prompter_sg/prompter_sg.dart';

void main() {
  final prompter = Prompter();

  final choice = prompter.askBinary('Are you here to convert an image?');
  if (!choice) {
    exit(0);
  }

  final format = prompter.askMultiple('Select format:', buildFormatOptions());
//  prompter.askMultiple('Select an image to convert:', buildFileOptions());
  buildFileOptions();
}

List<Option> buildFileOptions() {
  Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) && entity.path.contains(RegExp(r'\.(png|jpg|jpeg)'));
  });
}

List<Option> buildFormatOptions() {
  return [
    Option('Conver to jpeg', 'jpeg'),
    Option('Conver to png', 'png'),
  ];
}
