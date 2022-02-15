func solution(_ n:Int) -> Int {
    var x = 1
    var y = 1
    var n = n - 1
    while n > 0 {
        let z = (x + y) % 1234567
        x = y
        y = z
        n -= 1
    }
    return y
}