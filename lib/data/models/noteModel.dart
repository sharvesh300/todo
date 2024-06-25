class NoteModel {
  String? title;
  String? content;
  String? id;

  NoteModel({this.title, this.content, this.id});

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['id'] = this.id;
    return data;
  }
}
