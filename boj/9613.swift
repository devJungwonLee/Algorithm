func gcd(_ a: Int, _ b: Int) -> Int {
    let x = max(a, b)
    let y = min(a, b)
    if x % y == 0 { return y }
    return gcd(y, x%y)
}

let t = Int(readLine()!)!
for _ in 0..<t {
    var a = readLine()!.split(separator: " ").map { Int($0)! }
    a.removeFirst()
    var sum = 0
    for i in 0..<a.count {
        for j in (i+1)..<a.count {
            sum += gcd(a[i], a[j])
        }
    }
    print(sum)
}
