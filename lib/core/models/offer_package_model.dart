class OfferPackageModel {
  final double percentage; // İndirim yüzdesi
  final double oldAmount; // Eski fiyat
  final double newAmount; // Yeni fiyat
  final double weeklyPrice; // Haftalık fiyat
  final bool isPopular; // Popüler mi

  OfferPackageModel({
    required this.percentage,
    required this.oldAmount,
    required this.newAmount,
    required this.weeklyPrice,
    this.isPopular = false,
  });
}
