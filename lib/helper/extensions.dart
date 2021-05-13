extension Cleansing on String {
  String sanitize() => this
      .replaceAll(
        '&amp;',
        '&',
      )
      .replaceAll(
        'http:',
        'https:',
      )
      .replaceAll(
        '&quot;',
        '\"',
      );
}
