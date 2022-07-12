fun main() {
    val s = readLine()!!.split(' ').map { it.toInt() }
    var a = s[0]
    val b = s[1]
    var n = s[2]
    var q = 0

    while (n > 0) {
        a = a % b * 10
        q = a / b
        n--;
    }
    println(q)
}