/// Formats Algerian Dinar amounts with thin-space thousands grouping (e.g. "1 250 DZD").
/// Pass the localized currency label from `.arb` (e.g. "DZD" or "دج").
String formatDzd(num amount, {required String currencyLabel}) {
  final bool isNegative = amount < 0;
  final String digits = amount.abs().round().toString();
  final StringBuffer buffer = StringBuffer();

  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      buffer.write(' '); // thin space
    }
    buffer.write(digits[i]);
  }

  final String formatted = isNegative ? '-${buffer.toString()}' : buffer.toString();
  return '$formatted $currencyLabel';
}
