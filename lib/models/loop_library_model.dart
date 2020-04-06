import 'package:flutter_tutorial/generated/json/base/json_convert_content.dart';
import 'package:flutter_tutorial/generated/json/base/json_filed.dart';

class LoopLibraryModel with JsonConvert<LoopLibraryModel> {
  String status;
  String message;
  List<LoopLibraryCard> cards;
}

class LoopLibraryCard with JsonConvert<LoopLibraryCard> {
  @JSONField(name: "theme_action_title")
  String themeActionTitle;
  @JSONField(name: "theme_id")
  int themeId;
  @JSONField(name: "theme_name")
  String themeName;
  List<LoopLibraryCardsLoop> loops;
  @JSONField(name: "theme_color")
  String themeColor;
}

class LoopLibraryCardsLoop with JsonConvert<LoopLibraryCardsLoop> {
  @JSONField(name: "loop_description_why")
  String loopDescriptionWhy;
  @JSONField(name: "loop_id")
  int loopId;
  @JSONField(name: "loop_description")
  String loopDescription;
  @JSONField(name: "loop_description_what")
  String loopDescriptionWhat;
  @JSONField(name: "loop_seq_order")
  int loopSeqOrder;
  @JSONField(name: "loop_type")
  String loopType;
  @JSONField(name: "redo_count")
  int redoCount;
  @JSONField(name: "total_stars")
  int totalStars;
  @JSONField(name: "lock_status")
  int lockStatus;
  @JSONField(name: "loop_title")
  String loopTitle;
}
