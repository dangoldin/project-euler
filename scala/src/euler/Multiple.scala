package euler

object Multiple {
  def gcd(a: Int, b:Int):Int = if (b==0) a.abs else gcd(b, a%b)
  def lcm(a: Int, b:Int):Int = (a*b).abs/gcd(a,b)
}