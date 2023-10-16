let input = readLine()!.split(separator: " ").map { Int($0)! }
var a = input[0]
var b = input[1]
var i = 0
while true {
    if i % 2 == 0 { b += a }
    else { a += b }
    if a < 5 && b < 5 { i += 1 }
    else {
        if a >= 5 { print("yj") }
        else { print("yt") }
        break
    }
}