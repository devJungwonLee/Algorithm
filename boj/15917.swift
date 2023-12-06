var i = 0
var num = 1
var s = Set<Int>()
while i < 32 {
    s.insert(num)
    i += 1
    num *= 2
}
let q = Int(readLine()!)!
for _ in 0..<q {
    let n = Int(readLine()!)!
    if s.contains(n) { print("1") }
    else { print("0") }
}