package euler

import scala.collection.mutable.HashMap;

object P14 {
  def nextCollatzNumber(n:Long) =
    if (n % 2 == 0) n / 2
    else 3 * n + 1

  def getCollatzChain(n:Long, c:HashMap[Long, List[Long]], acc: List[Long]):List[Long] =
    if (n == 1L) acc
    else {
      val nextN = nextCollatzNumber(n)
      c.get(nextN) match {
        case None => getCollatzChain(nextN, c, nextN::acc)
        case Some(i) => nextN :: acc
      }
    }

  def main(args: Array[String]) {
    val c = new HashMap[Long, List[Long]]
    var (i, maxI, maxCnt) = (1L,0L,0L)

    while (i < 1000000L) {
      val l = getCollatzChain(i, c, List(i))
//      println(i + " => " + l)
      if (l.size > maxCnt) {
        maxCnt = l.size
        maxI = i
      }
      i += 1
    }
    println(maxI + " => " + maxCnt)
  }
}
