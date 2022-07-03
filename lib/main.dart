
import 'package:english_card/data/helpers/dictionary_api_helper.dart';
import 'package:english_card/data/helpers/random_word_api_helper.dart';
import 'package:english_card/data/models/vocabulary_local.dart';
import 'package:english_card/data/models/vocabulary_remote.dart';
import 'package:english_card/data/repositories/vocabulary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';

import 'app/my_app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());

}


