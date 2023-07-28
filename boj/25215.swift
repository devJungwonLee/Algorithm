let s = readLine()!.map { String($0) }
var d = [[Int]](repeating: [Int](repeating: 0, count: 2), count: s.count)
for i in 0..<s.count {
    if s[i] == s[i].lowercased() {
        if i == 0 { 
            d[i][0] = 1
            d[i][1] = 2
        } else {
            d[i][0] = min(d[i-1][0] + 1, d[i-1][1] + 2)
            d[i][1] = min(d[i-1][0] + 2, d[i-1][1] + 2)
        }
    } else {
        if i == 0 {
            d[i][0] = 2
            d[i][1] = 2
        } else {
            d[i][0] = min(d[i-1][0] + 2, d[i-1][1] + 2)
            d[i][1] = min(d[i-1][0] + 2, d[i-1][1] + 1)
        }
    }
}
print(d[s.count-1].min()!)