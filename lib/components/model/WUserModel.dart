class User {
  final int? id;
  final String? name;
  final String? avatarUrl;
  bool? isHide;
  bool? isAddToGroup;

  User({
    this.id,
    this.name,
    this.avatarUrl,
    this.isHide,
    this.isAddToGroup
  });
}