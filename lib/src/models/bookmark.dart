class Bookmark {
  String? title, image;
  List<BookmarkSubItem>? items = [];

  Bookmark({this.title, this.image, this.items});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> remindersList =
        items?.map((item) => item.toJson()).toList() ?? [];
    return {
      'title': title,
      'items': items,
      'image': image,
    };
  }

  Bookmark.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['image'],
        items = (json['items'] == null || json['items'] == "")
            ? []
            : (json['items'] as List<dynamic>)
                .map((e) => BookmarkSubItem.fromJson(e))
                .toList();
}

class BookmarkSubItem {
  String? title, link;

  BookmarkSubItem({this.title, this.link});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
    };
  }

  BookmarkSubItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        link = json['link'];
}
