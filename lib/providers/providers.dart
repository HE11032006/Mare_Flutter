import 'package:flutter/foundation.dart';
import '../models/dashboardModels.dart';
/// Dashboard state provider
/// Principle: Single Responsibility - Only manages dashboard state
/// Principle: Dependency Inversion - Depends on IDashboardService abstraction
class DashboardProvider extends ChangeNotifier {
  // State
  int _currentNavIndex = 0;
  int get currentNavIndex => _currentNavIndex;

  int _currentFunnelTabIndex = 0;
  int get currentFunnelTabIndex => _currentFunnelTabIndex;

  CustomerSentiment _customerSentiment = const CustomerSentiment(
    posCount: 34,
    neuCount: 200,
    negCount: 45,
  );

  CustomerSentiment get customerSentiment => _customerSentiment;

  // Méthode pour mettre à jour depuis l'interface plus tard
  void updateCounts(int pos, int neu, int neg) {
    _customerSentiment = CustomerSentiment(
      posCount: pos,
      neuCount: neu,
      negCount: neg,
    );
    notifyListeners();
  }

  /// Update bottom navigation index
  void setNavIndex(int index) {
    if (_currentNavIndex != index) {
      _currentNavIndex = index;
      notifyListeners();
    }
  }

  /// Update funnel tab index
  void setFunnelTabIndex(int index) {
    if (_currentFunnelTabIndex != index) {
      _currentFunnelTabIndex = index;
      notifyListeners();
    }
  }
}
