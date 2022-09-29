let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let p = s[1]
let q = s[2]
var d = [Int](repeating: 0, count: 100001)
d[0] = 1
func find(_ n: Int) -> Int {
    if n <= 100000 && d[n] != 0 { return d[n] }
    let a = find(n/p)
    let b = find(n/q)
    if n <= 100000 { d[n] = a + b }
    return a + b
}
print(find(n))
