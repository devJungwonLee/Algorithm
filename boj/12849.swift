let t = Int(readLine()!)!
var adj = [[Int]](repeating: [], count: 8)
adj[0] = [1, 3]
adj[1] = [0, 2, 3]
adj[2] = [1, 3, 4, 5]
adj[3] = [0, 1, 2, 5]
adj[4] = [2, 5, 6]
adj[5] = [2, 3, 4, 7]
adj[6] = [4, 7]
adj[7] = [5, 6]
var d = [[Int]](repeating: [Int](repeating: 0, count: 8), count: t + 1)
d[0][0] = 1
for i in 0..<t {
    for j in 0..<8 {
        if d[i][j] == 0 { continue }
        for k in adj[j] {
            d[i+1][k] = (d[i+1][k] + d[i][j]) % 1000000007
        }
    }
}
print(d[t][0])