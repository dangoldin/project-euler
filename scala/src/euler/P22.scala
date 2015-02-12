package euler

object P22 {
  def digitValue(n:Char):Int =
    n.toInt - 'A'.toInt + 1

  def main(args: Array[String]) {
    val source = scala.io.Source.fromFile("/Users/danielgoldin/Downloads/p022_names.txt")
    var lines = source.mkString.replaceAll("\"","").split(",")
    source.close()

    lines = lines.sorted

    var s = 0
    for (i <- 0 to lines.length-1) {
      s += (i+1) * (lines(i).toCharArray.map(digitValue).foldLeft(0)(_+_))
    }
    println("Sum: " + s)
  }
}
