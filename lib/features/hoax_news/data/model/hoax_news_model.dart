class HoaxNewsModel {
  String? source;
  int? total;
  List<Articles>? articles;

  HoaxNewsModel({this.source, this.total, this.articles});

  HoaxNewsModel.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    total = json['total'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['total'] = total;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? title;
  String? url;
  String? content;
  String? date;
  String? thumbnail;
  String? foundWith;

  Articles(
      {this.title,
      this.url,
      this.content,
      this.date,
      this.thumbnail,
      this.foundWith});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    content = json['content'];
    date = json['date'];
    thumbnail = json['thumbnail'];
    foundWith = json['foundWith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['url'] = url;
    data['content'] = content;
    data['date'] = date;
    data['thumbnail'] = thumbnail;
    data['foundWith'] = foundWith;
    return data;
  }
}
