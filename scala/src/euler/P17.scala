package euler

object P17 {
  def toWords(n:Int):Int = n match {
    case 1 => 3
    case 2 => 3
    case 3 => 5
    case 4 => 4
    case 5 => 4
    case 6 => 3
    case 7 => 5
    case 8 => 5
    case 9 => 4
    case 10 => 3
    case 11 => 6
    case 12 => 6
    case 13 => 8
    case 14 => 8
    case 15 => 7
    case 16 => 7
    case 17 => 9
    case 18 => 8
    case 19 => 8
    case 20 => 6
    case 30 => 6
    case 40 => 6
    case 50 => 5
    case 60 => 5
    case 70 => 7
    case 80 => 6
    case 90 => 6
    case a if a < 100 => toWords(n - n % 10) + toWords(n % 10)
    case a if a < 1000 && a % 100 == 0 => toWords(n/100) + 7
    case a if a < 1000 => toWords(n -n % 100) + 3 + toWords(n % 100)
    case 1000 => 3 + 8 // "one thousand"
    case _ => 0 // > 1000 so ignore
  }

  def main(args: Array[String]) {
    val s = (1 to 1000).map(toWords).sum
    println("Num letters:" + s)
  }
}
