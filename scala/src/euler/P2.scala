package euler

import scala.util.control.Breaks._

object P2 {
  def main(args: Array[String]) {
    var f = Array(0,1);
    var sum = 0;
    breakable {
      while(true) {
        if (f(0) % 2 == 0) {
          println(f(0))
          sum += f(0);
        }
        f = Array(f(1), f(0) + f(1));
        if (f(0) > 4000000) break
      }
    }
    println("Sum: " + sum);
  }
}