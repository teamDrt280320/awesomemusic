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
      )
      .replaceAll(
        '&#039;',
        '\'',
      );

  String highRes() => this.replaceAll('150x150', '500x500');
  String lowRes() => this.replaceAll('150x150', '75x75');
  String mediumRes() => this.replaceAll('150x150', '250x250');
  String artwork() => this.replaceAll('.m4a', '_artwork.jpg');
}
