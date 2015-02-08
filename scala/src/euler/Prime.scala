package euler

// From http://stackoverflow.com/questions/9711785/find-prime-numbers-using-scala-help-me-to-improve
object Prime {
  def is(i: Long) =
    if (i == 2) true
    else if ((i & 1) == 0) false // efficient div by 2
    else prime(i)

  def primes: Stream[Long] = 2 #:: prime3

  // performance: avoid redundant divide by two, so this starts at 3
  private val prime3: Stream[Long] = {
    def next(i: Long): Stream[Long] =
      if (prime(i))
        i #:: next(i + 2)
      else
        next(i + 2) // tail
    3 #:: next(5)
  }

  // assumes not even, check evenness before calling - perf note: must pass partially applied >= method
  private def prime(i: Long) =
    prime3 takeWhile (math.sqrt(i).>= _) forall { i % _ != 0 }
}