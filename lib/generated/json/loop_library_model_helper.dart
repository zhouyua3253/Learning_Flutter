import 'package:flutter_tutorial/models/loop_library_model.dart';

loopLibraryModelFromJson(LoopLibraryModel data, Map<String, dynamic> json) {
  if (json['status'] != null) {
    data.status = json['status']?.toString();
  }
  if (json['message'] != null) {
    data.message = json['message']?.toString();
  }
  if (json['cards'] != null) {
    data.cards = new List<LoopLibraryCard>();
    (json['cards'] as List).forEach((v) {
      data.cards.add(new LoopLibraryCard().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> loopLibraryModelToJson(LoopLibraryModel entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['status'] = entity.status;
  data['message'] = entity.message;
  if (entity.cards != null) {
    data['cards'] = entity.cards.map((v) => v.toJson()).toList();
  }
  return data;
}

loopLibraryCardFromJson(LoopLibraryCard data, Map<String, dynamic> json) {
  if (json['theme_action_title'] != null) {
    data.themeActionTitle = json['theme_action_title']?.toString();
  }
  if (json['theme_id'] != null) {
    data.themeId = json['theme_id']?.toInt();
  }
  if (json['theme_name'] != null) {
    data.themeName = json['theme_name']?.toString();
  }
  if (json['loops'] != null) {
    data.loops = new List<LoopLibraryCardsLoop>();
    (json['loops'] as List).forEach((v) {
      data.loops.add(new LoopLibraryCardsLoop().fromJson(v));
    });
  }
  if (json['theme_color'] != null) {
    data.themeColor = json['theme_color']?.toString();
  }
  return data;
}

Map<String, dynamic> loopLibraryCardToJson(LoopLibraryCard entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['theme_action_title'] = entity.themeActionTitle;
  data['theme_id'] = entity.themeId;
  data['theme_name'] = entity.themeName;
  if (entity.loops != null) {
    data['loops'] = entity.loops.map((v) => v.toJson()).toList();
  }
  data['theme_color'] = entity.themeColor;
  return data;
}

loopLibraryCardsLoopFromJson(
    LoopLibraryCardsLoop data, Map<String, dynamic> json) {
  if (json['loop_description_why'] != null) {
    data.loopDescriptionWhy = json['loop_description_why']?.toString();
  }
  if (json['loop_id'] != null) {
    data.loopId = json['loop_id']?.toInt();
  }
  if (json['loop_description'] != null) {
    data.loopDescription = json['loop_description']?.toString();
  }
  if (json['loop_description_what'] != null) {
    data.loopDescriptionWhat = json['loop_description_what']?.toString();
  }
  if (json['loop_seq_order'] != null) {
    data.loopSeqOrder = json['loop_seq_order']?.toInt();
  }
  if (json['loop_type'] != null) {
    data.loopType = json['loop_type']?.toString();
  }
  if (json['redo_count'] != null) {
    data.redoCount = json['redo_count']?.toInt();
  }
  if (json['total_stars'] != null) {
    data.totalStars = json['total_stars']?.toInt();
  }
  if (json['lock_status'] != null) {
    data.lockStatus = json['lock_status']?.toInt();
  }
  if (json['loop_title'] != null) {
    data.loopTitle = json['loop_title']?.toString();
  }
  return data;
}

Map<String, dynamic> loopLibraryCardsLoopToJson(LoopLibraryCardsLoop entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['loop_description_why'] = entity.loopDescriptionWhy;
  data['loop_id'] = entity.loopId;
  data['loop_description'] = entity.loopDescription;
  data['loop_description_what'] = entity.loopDescriptionWhat;
  data['loop_seq_order'] = entity.loopSeqOrder;
  data['loop_type'] = entity.loopType;
  data['redo_count'] = entity.redoCount;
  data['total_stars'] = entity.totalStars;
  data['lock_status'] = entity.lockStatus;
  data['loop_title'] = entity.loopTitle;
  return data;
}
