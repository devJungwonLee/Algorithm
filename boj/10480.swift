let n = Int(readLine()!)!
for _ in 0..<n {
    let x = Int(readLine()!)!
    var y = x
    if x < 0 { y *= -1 }
    y % 2 == 0 ? print("\(x) is even") : print("\(x) is odd")
}