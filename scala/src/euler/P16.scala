package euler

object P16 {
  def main(args: Array[String]) {
    val v = BigInt(2).pow(1000).toString.toCharArray.map(_.asDigit).sum
    println("Sum: " + v)
  }
}