extension boolsExtentions on bool {
  bool get toggle => this == true ? false : true;
}

extension boolsOptionalsExtentions on bool? {
  bool get toggle => this == true ? false : true;
  int get toInt => this == null || this == false ? 0 : 1;
}
