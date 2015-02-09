package euler

import scala.util.control.Breaks._

object P10 {
  def main (args: Array[String]) {
    var s = 0L
    breakable {
      for (p <- Prime.primes) {
        if (p > 2000000) {
          break
        }
        s += p
      }
    }
    println("Sum: " + s)
  }
}