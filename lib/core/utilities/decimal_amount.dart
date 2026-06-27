String formatDecimalAmount(double value) {
  final text = value.toString();
  if (!text.contains('.')) return text;
  return text
      .replaceFirst(RegExp(r'0+$'), '')
      .replaceFirst(RegExp(r'\.$'), '');
}

bool amountExceedsDue(double amount, double amountDue) =>
    amount > amountDue + 1e-9;
