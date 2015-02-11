package euler

import java.util.Calendar

object P19 {
  def main(args: Array[String]) {
    var numSundays = 0
    var cal = Calendar.getInstance()
    cal.set(Calendar.DAY_OF_MONTH, 1)

    for (year <- 1901 to 2000) {
      cal.set(Calendar.YEAR, year)
      for (month <- 1 to 12) {
        cal.set(Calendar.MONTH, month)
        if (1 == cal.get(Calendar.DAY_OF_WEEK)) {
          numSundays += 1
        }
      }
    }
    println("Num sundays: " + numSundays)
  }
}
