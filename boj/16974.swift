let input = readLine()!.split(separator: " ").map { Int64($0)! }
let n = Int(input[0])
let x = input[1]
var d = [Int64](repeating: 0, count: n + 1)
var p = [Int64](repeating: 0, count: n + 1)
d[0] = 1
p[0] = 1
for i in 1...n { 
    d[i] = d[i-1] * 2 + 3
    p[i] = p[i-1] * 2 + 1
}
func find(_ a: Int, _ b: Int64) -> Int64 {
    if b == 1 { return a == 0 ? 1 : 0 }
    if b == d[a] { return p[a] }
    let mid = (1 + d[a]) / 2
    if b == mid { return p[a-1] + 1 }
    else if b > mid { return p[a-1] + 1 + find(a - 1, b - d[a-1] - 2) }
    else { return find(a - 1, b - 1) }
}
print(find(n, x))