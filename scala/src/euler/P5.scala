package euler

object P5 {
  def main (args: Array[String]) {
    var (i, prod) = (1,1)
    for (i <- 2 to 19) {
      prod = Multiple.lcm(prod, i)
    }
    println("Product: " + prod)
  }
}