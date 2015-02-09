package euler

object P15 {
  def fact(n:BigInt):BigInt =
    if (n == 0) 1
    else n * fact(n-1)

  def main(args: Array[String]) {
    println( fact(40)/(fact(20) * fact(20)) )
  }
}
