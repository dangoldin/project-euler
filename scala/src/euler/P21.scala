package euler

import java.util

import scala.collection.JavaConversions._

object P21 {
  def divisors(n: Int): List[Int] =
    for (i <- List.range(1, n/2 + 1) if n % i == 0) yield i

  def main(args: Array[String]) {
    val m = new util.HashMap[Int,Int]

    for (i <- 2 to 10000) {
      m.put(i, divisors(i).sum)
      println(i + " => " + divisors(i).sum)
    }

    var s = 0
    for (i <- m.keySet()) {
      val j = m.get(i)
      if (m.containsKey(j) && i != j && m.get(j) == i) {
        println("Amicable: " + i)
        s += i
      }
    }
    println("Amicable sum: " + s)
  }
}
