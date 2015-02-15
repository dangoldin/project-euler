package euler

object P27 {
  def main(args: Array[String]) {
    val primes = Prime.primes.take(100000).toSet
    var prod = 0
    var max = 0

    // b needs to be prime
    for (a <- -1000 to 1000; b <- 2 to 1000 if primes.contains(b)) {
      var n = 0
      while (primes.contains(n*n + a * n + b)) {
        n += 1
      }
      if (n > max) {
        max = n
        prod = a * b
      }
    }

    println("Prod: " + prod)
  }
 }
