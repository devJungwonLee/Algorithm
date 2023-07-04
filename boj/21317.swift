let n = Int(readLine()!)!
var energy = [[Int]]()
for _ in 0..<(n-1) {
    energy.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let k = Int(readLine()!)!
var d = [[Int]](repeating: [Int](repeating: Int.max, count: 2), count: n)
d[0][0] = 0
d[0][1] = 99999999
for i in 0..<(n-1) {
    if i + 1 < n { 
        d[i+1][0] = min(d[i+1][0], d[i][0] + energy[i][0])
        d[i+1][1] = min(d[i+1][1], d[i][1] + energy[i][0])
    }
    if i + 2 < n { 
        d[i+2][0] = min(d[i+2][0], d[i][0] + energy[i][1])
        d[i+2][1] = min(d[i+2][1], d[i][1] + energy[i][1])
    }
    if i + 3 < n {
        d[i+3][1] = min(d[i+3][1], d[i][0] + k)
    }
}
print(min(d[n-1][0], d[n-1][1]))