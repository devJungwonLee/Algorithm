import Foundation

var n = 0
var adj = [[Int]]()
var d = [[Int]]()
var s = [Int]()

func dfs(_ parent: Int) {
    d[parent][1] = s[parent]
    if adj[parent].isEmpty { returan }
    var minValue = Int.max
    for child in adj[parent] {
        dfs(child)
        if d[child][0] < d[child][1] {
            d[parent][0] += d[child][0]
            d[parent][1] += d[child][0]
            minValue = min(minValue, d[child][1] - d[child][0])
        } else {
            d[parent][0] += d[child][1]
            d[parent][1] += d[child][1]
            minValue = 0
        }
    }
    d[parent][0] += minValue
}

func solution(_ sales:[Int], _ links:[[Int]]) -> Int {
    n = sales.count
    s = sales
    adj = [[Int]](repeating: [], count: n)
    d = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
    for link in links {
        let v1 = link[0] - 1
        let v2 = link[1] - 1
        adj[v1].append(v2)
    }
    dfs(0)
    return min(d[0][0], d[0][1])
}