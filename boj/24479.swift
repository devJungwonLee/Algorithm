let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
let r = s[2]
var adj = [[Int]](repeating: [Int](), count: n+1)
var cnt = 0
var order = [Int](repeating: 0, count: n+1)
for _ in 0..<m {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    let u = s[0]
    let v = s[1]
    adj[u].append(v)
    adj[v].append(u)
}
adj = adj.map { $0.sorted() }

func dfs(_ x: Int) {
    for y in adj[x] {
        if order[y] > 0 { continue }
        cnt += 1
        order[y] = cnt
        dfs(y)
    }
}

cnt += 1
order[r] = cnt
dfs(r)
for i in 1..<order.count { print(order[i]) }
