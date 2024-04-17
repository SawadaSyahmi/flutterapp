class Criterion {
  String title;
  String description;

  Criterion(this.title, this.description);
}

class Scale {
  int value;
  String title;

  Scale(this.value, this.title);
}

List<Criterion> criteria = [
  Criterion('Interaction', 'Degree of interaction with other members'),
  Criterion('Commitment', 'Degree of participation to the project execution'),
  Criterion('Effort',
      'The amount of effort and work contributed to the project outcome'),
  Criterion('Adaptability', 'Ease of adapting to the group'),
  Criterion('Personality', 'Degree of compromisation between group members'),
];

List<Scale> scales = [
  Scale(4, 'Excellent'),
  Scale(3, 'Good'),
  Scale(2, 'Fair'),
  Scale(1, 'Poor'),
  Scale(0, 'Not at all')
];
