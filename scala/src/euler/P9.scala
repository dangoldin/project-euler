package euler

object P9 {
  def main(args: Array[String]) {
    for (m <- 1 to 1000; n <- 1 to m) {
      val (m2, n2) = (m * m, n * n)
      val (a, b, c) = (m2 - n2, 2 * m * n, m2 + n2)

      if (a + b + c == 1000) {
        println("Triplet: " + a + "," + b + "," + c)
        println("Product: " + a * b * c)
      }
    }
  }
}
