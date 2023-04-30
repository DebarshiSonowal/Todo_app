class Bookmark {
  String? title, image;
  List<BookmarkSubItem>? items = [];

  Bookmark({this.title, this.image, this.items});
}

class BookmarkSubItem {
  String? title, link;

  BookmarkSubItem({this.title, this.link});
}
