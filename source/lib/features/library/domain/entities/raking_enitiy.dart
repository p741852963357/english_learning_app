class Ranking {
  DateTime now;
  int studyTimes;

  Ranking(this.now, this.studyTimes);

  Ranking copyWith({
    DateTime? now,
    int? studyTimes,
  }) {
    return Ranking(
      now ?? this.now,
      studyTimes ?? this.studyTimes,
    );
  }
}
