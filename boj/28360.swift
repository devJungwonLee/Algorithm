let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var adj = [[Int]](repeating: [Int](), count: n + 1)
var w = [Double](repeating: 0.0, count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
}
w[1] = 100.0;
for x in 1...n {
    if adj[x].isEmpty { continue }
    for y in adj[x] {
        w[y] += w[x] / Double(adj[x].count)
    }
    w[x] = 0.0
}
print(w.max()!)