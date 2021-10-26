class Helper {
  static String getID(String origin) {
    String ac = 'abcdefghijklmnopqrstuvwxyz';
    StringBuffer stringBuffer = StringBuffer();

    for (int i = 0; i < origin.length; i++) {
      var s = origin.toLowerCase()[i];
      if (ac.contains(s)) stringBuffer.write(s);
    }

    return stringBuffer.toString();
  }
}
