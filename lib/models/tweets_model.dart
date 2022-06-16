import 'package:hive/hive.dart';
part 'tweets_model.g.dart';

@HiveType(typeId: 0)
class TweetsModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String text;
  @HiveField(2)
  String smiles;
  TweetsModel({required this.name, required this.text, this.smiles = ""});
}

List<TweetsModel> newList = [
  TweetsModel(
      name: "Valera",
      text:
          "Тут супер пупер текст большооооооооооооооооооооооооооооооооооооой 1"),
  TweetsModel(name: "Valera", text: "Тут супер пупер текст твита 2"),
  TweetsModel(name: "Valera", text: "Тут супер пупер текст твита 3"),
  TweetsModel(name: "Valera", text: "Тут супер пупер текст твита 4")
];
