// To parse this JSON data, do
//
//     final courseResponseEntity = courseResponseEntityFromJson(jsonString);

import 'dart:convert';

List<CourseResponseEntity> courseResponseEntityFromJson(String str) => List<CourseResponseEntity>.from(json.decode(str).map((x) => CourseResponseEntity.fromJson(x)));

String courseResponseEntityToJson(List<CourseResponseEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseResponseEntity {
    int? id;
    String? name;
    String? description;
    String? uploader;
    int? typeId;
    String? follow;
    String? lessonNumber;
    String? price;
    String? score;
    String? videoLength;
    DateTime createdAt;
    DateTime updatedAt;
    String? img;
    String? video;
    int category;
    int teacher;

    CourseResponseEntity({
        this.id,
        this.name,
        this.description,
        this.uploader,
        this.typeId,
        this.follow,
        this.lessonNumber,
        this.price,
        this.score,
        this.videoLength,
        required this.createdAt,
        required this.updatedAt,
        this.img,
        this.video,
        required this.category,
        required this.teacher,
    });

    factory CourseResponseEntity.fromJson(Map<String, dynamic> json) => CourseResponseEntity(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        uploader: json["uploader"],
        typeId: json["type_id"],
        follow: json["follow"],
        lessonNumber: json["lesson_number"],
        price: json["price"],
        score: json["score"],
        videoLength: json["video_length"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        img: json["img"],
        video: json["video"],
        category: json["Category"],
        teacher: json["Teacher"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "uploader": uploader,
        "type_id": typeId,
        "follow": follow,
        "lesson_number": lessonNumber,
        "price": price,
        "score": score,
        "video_length": videoLength,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "img": img,
        "video": video,
        "Category": category,
        "Teacher": teacher,
    };
}
