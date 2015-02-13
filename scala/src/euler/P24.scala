package euler

object P24 {
  def main(args: Array[String]) {
    println(List(0,1,2,3,4,5,6,7,8,9).permutations.drop(999999).next.foldLeft("")(_+_))
  }
 }
