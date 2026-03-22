class VideoModel {
  final String url;
  String profilImage;
  int like;
  final int comment;
  final int bookmark;
  final int share;
  bool isLike;

  VideoModel(
      {required this.url,
      this.profilImage="https://picsum.photos/200/300",
      required this.like,
      required this.comment,
      required this.bookmark,
      required this.share,
      this.isLike=false});
}
