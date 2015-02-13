package euler

object P23 {
  // Pretty cool function I found in someone else's solution.
  // Need to start thinking in terms of lists
  def divisors(x: Int): List[Int] =
    1 :: (for(i <- 2 to math.sqrt(x).toInt if x % i == 0) yield {
      List(i,(x/i).toInt)
    }).toList.flatten.distinct

  def isAbundant(x:Int): Boolean =
    divisors(x).sum > x

  def abundantNumbers() =
    (for(i <- 1 to 28123 if isAbundant(i)) yield i).toList

  def main(args: Array[String]) {
    val an = abundantNumbers()
    val numbers = Array.range(1, 28123 + 1)

    for (i <- an; j <- an) {
      if (i + j <= 28123) {
        numbers(i + j - 1) = 0
      }
    }

    println("Sum: " + numbers.sum)
  }
}
