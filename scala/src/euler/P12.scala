package euler

object P12 {
  def main(args : Array[String]){
    var (s, n, d) = (0, 1, 0)
    while (d < 500) {
      s += n
      n += 1
      d = 0
      for (i <- 1 to math.sqrt(s).toInt) {
        if (s % i == 0) {
          d += 1
        }
      }
      d *= 2
    }
    println(s)
  }
}