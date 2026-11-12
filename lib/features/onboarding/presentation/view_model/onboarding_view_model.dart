import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();

  int _currentPage = 0;
  String _name = '';
  String _age = '';
  String? _gender;
  String _height = '';
  String _weight = '';
  String _bodyFat = '';
  String? _selectedGoal;

  // Getters
  int get currentPage => _currentPage;
  String get name => _name;
  String get age => _age;
  String? get gender => _gender;
  String get height => _height;
  String get weight => _weight;
  String get bodyFat => _bodyFat;
  String? get selectedGoal => _selectedGoal;

  static const int totalPages = 6;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setAge(String value) {
    _age = value;
    notifyListeners();
  }

  void setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  void setHeight(String value) {
    _height = value;
    notifyListeners();
  }

  void setWeight(String value) {
    _weight = value;
    notifyListeners();
  }

  void setBodyFat(String value) {
    _bodyFat = value;
    notifyListeners();
  }

  void setGoal(String value) {
    _selectedGoal = value;
    notifyListeners();
  }

  bool get canProceed {
    switch (_currentPage) {
      case 0: // Welcome
      case 1: // How It Works
      case 2: // Progress Tracking
        return true;
      case 3: // Basic Information
        return _name.isNotEmpty && _age.isNotEmpty && _gender != null;
      case 4: // Measurements
        return _height.isNotEmpty && _weight.isNotEmpty;
      case 5: // Goal Selection
        return _selectedGoal != null;
      default:
        return false;
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
