fun main() {
    val n = readLine()!!.toInt()
    for (i in 1..(n+2)) {
        for (j in 1..(n+2)) {
            if (i==1 || i==n+2 || j==1 || j==n+2) print("@")
            else print(" ")
        }
        println("")
    }
}