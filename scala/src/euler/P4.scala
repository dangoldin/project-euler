package euler

object P4 {
  def main(args: Array[String]) {
    def isPalindrome(s: String) =
      s.equals(s.reverse)

    var (i, j, max) = (0,0,0);
    for (i <- 1 to 999; j <- 1 to 999) {
      val p = i * j
      if (p > max && isPalindrome("" + p)) {
        max = p
      }
    }
    println("Max palindrome: " + max)
  }
}
