class Item {
  final String header;
  final String body;
  bool isExpanded;

  Item({
    required this.header,
    required this.body,
    this.isExpanded=false
  });
}