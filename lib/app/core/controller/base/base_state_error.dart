import 'package:match/match.dart';

@match
enum BaseStateError {
  none,
  unknown,
  remote,
  //TODO add here common errors for the app, such as internetConnection?
}
