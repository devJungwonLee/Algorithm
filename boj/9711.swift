let t = Int(readLine()!)!
var d = [[[Int]]](repeating: [[Int]](), count: 10001)
var q = 0

func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
    let x = ((a[0][0] * b[0][0] % q) + (a[0][1] * b[1][0] % q)) % q
    let y = ((a[0][0] * b[0][1] % q) + (a[0][1] * b[1][1] % q)) % q
    let z = ((a[1][0] * b[0][0] % q) + (a[1][1] * b[1][0] % q)) % q
    let w = ((a[1][0] * b[0][1] % q) + (a[1][1] * b[1][1] % q)) % q
    return [[x, y], [z, w]]
}

func matrix(_ n: Int) -> [[Int]] {
    if !d[n].isEmpty { return d[n] }
    if n == 1 { d[n] = [[1, 1], [1, 0]] }
    else if n % 2 == 1 { d[n] = multiply(matrix(n-1), matrix(1)) }
    else { d[n] = multiply(matrix(n/2), matrix(n/2)) }
    return d[n]
}

func findR(_ n: Int) -> Int {
    let a = matrix(n)
    return (a[0][0] + a[0][1]) % q
}

for i in 0..<t {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    let p = s[0]
    q = s[1]
    var r = 0
    d = [[[Int]]](repeating: [[Int]](), count: 10001)
    if q == 1 { r = 0 }
    else if p <= 2 { r = 1 % q }
    else { r = findR(p-2) }
    print("Case #\(i+1): \(r)")
}
