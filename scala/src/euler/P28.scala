package euler

object P28 {
  def main(args: Array[String]) {
    val limit = (1001 + 1)/2
    var s = BigInt(1)
    for (i <- 0 to limit - 2) {
      val c = (i * 2 + 1) * (i * 2 + 1)
      for (j <- 1 to 4) {
        s += c + (2 * i + 2) * j
      }
    }
    println("Sum: " + s)
  }
 }