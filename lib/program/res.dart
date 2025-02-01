class IsMobile {
  bool isMobile = false;
  static IsMobile mobile = IsMobile._private();
  IsMobile._private();

  bool get ismobile => isMobile;

  factory IsMobile() {
    return mobile;
  }
}