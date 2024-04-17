import 'group_member.dart';

class Assessment {
  GroupMember member;
  List<int> points;

  Assessment(this.member, this.points);
  Assessment.copy(Assessment from)
      : this(GroupMember.copy(from.member), [...from.points]);

  double get percent =>
      (points.reduce((sum, item) => sum + item) / 20.0) * 100.0;
}
