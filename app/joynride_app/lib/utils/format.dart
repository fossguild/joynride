String formatDate(DateTime date) {
  const List<String> weekdays = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];

  const List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  String weekday = weekdays[date.weekday - 1];
  String month = months[date.month - 1];

  return '$weekday, ${date.day} de $month';
}

double formatRating(int? rating, int numberOfRatings) {
  if (rating == null || numberOfRatings == 0) return 0.0;
  return rating / numberOfRatings;
}
