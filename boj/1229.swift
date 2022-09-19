let n = Int(readLine()!)!
var d = [Int](repeating: 0, count: n+1)
var hex = [Int]()
var k = 1
while 2*k*k-k <= n {
    hex.append(2*k*k-k)
    d[2*k*k-k] = 1
    k += 1
}

func find(_ n: Int, _ depth: Int) -> Int {
    if depth > 6 { return 6 }
    if d[n] > 0 { return d[n] }
    var result = 6
    for h in hex {
        if h >= n { break }
        result = min(result, 1 + find(n-h, depth+1))
    }
    d[n] = result
    return d[n]
}

print(find(n, 1))
