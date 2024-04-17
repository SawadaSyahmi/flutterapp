class GroupMember {
  String shortName;
  String fullName;

  GroupMember(this.shortName, this.fullName);
  GroupMember.copy(GroupMember from) : this(from.shortName, from.fullName);
}
