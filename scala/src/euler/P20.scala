package euler

object P20 {
  def fact(n:BigInt):BigInt =
    n match {
      case x:BigInt if x == 0 => 1
      case _ => n * fact(n-1)
    }

  def main(args: Array[String]) {
    println("Sum: " + fact(BigInt(100)).toString.map(_.asDigit).sum)
  }
}
