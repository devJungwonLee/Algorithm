var p = [[Double]](repeating: [Double](repeating: 0.0, count: 8), count: 8)
var q = [[Double]](repeating: [Double](repeating: 0.0, count: 3), count: 8)
let s = readLine()!.split(separator: " ").map { Int($0)! }
var idx = 0
for i in 0..<8 {
    for j in (i+1)..<8 {
        p[i][j] = Double(s[idx]) / 100.0
        p[j][i] = Double(100 - s[idx]) / 100.0
        idx += 1
    }
}
for i in 0..<8 {
    if i%2 == 0 { q[i][0] = p[i][i+1] }
    else { q[i][0] = p[i][i-1] }
}
for i in 0..<8 {
    let range = i<4 ? 0..<4 : 4..<8
    for j in range {
        if i/2 == j/2 { continue }
        q[i][1] += q[i][0] * q[j][0] * p[i][j];
    }
}
for i in 0..<8 {
    for j in 0..<8 {
        if i/4 == j/4 { continue }
        q[i][2] += q[i][1] * q[j][1] * p[i][j];
    }
}
print(q.map { String($0[2]) }.joined(separator: " "))
