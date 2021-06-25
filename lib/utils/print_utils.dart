class PrintUtils {
  static printWarning(String text) {
    print('\x1B[33m$text\x1B[0m');
  }

  static printGreen(String text) {
    print('\x1b[32m$text\x1B[0m');
  }

  static printError(String text) {
    print('\x1B[31m$text\x1B[0m');
  }

  static printMagenta(String text) {
    print('\x1B[35m$text\x1B[0m');
  }

  static printWhite(String text) {
    print('\x1b[37m$text\x1B[0m');
  }
}
