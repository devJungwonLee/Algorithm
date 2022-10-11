let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var a = 1
    while n / a > 0 { a *= 10 }
    if (n * n) % a == n % a { print("YES") }
    else { print("NO") }
}
