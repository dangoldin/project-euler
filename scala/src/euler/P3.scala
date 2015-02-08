package euler

object P3 {
  def main(args: Array[String]) {
    val n = 600851475143L
    var i = 0L;
    for (i <- 1L to math.sqrt(n).toLong
      if n % i == 0; if Prime.is(i)) {
      println(i)
    }
  }
}