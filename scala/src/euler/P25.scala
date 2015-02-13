package euler

object P25 {
  def main(args: Array[String]) {
    var (f0, f1) = (BigInt(1),BigInt(1))
    var i = 1

    while (f0.toString.length < 1000) {
      val t = f0
      f0 = f1
      f1 += t
      i += 1
    }

    println(i + "=>" + f0)
  }
 }
