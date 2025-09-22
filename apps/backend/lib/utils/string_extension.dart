extension StringExtension on String {
  (String firstName, String lastName) splitName() {
    final nameParts = split(' ');
    return (
      nameParts.first,
      nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ''
    );
  }
}
