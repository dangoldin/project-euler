package euler

object P6 {
  def main(args: Array[String]) {
    var (i, smsq, sqsm) = (1, 0, 0)
    for (i <- 1 to 100) {
      smsq += i*i
      sqsm += i
    }
    println("Diff: " + (sqsm * sqsm - smsq))
  }
}
