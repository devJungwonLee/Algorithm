import Foundation

var cost = [Int64]()
var adj = [[Int]]()
var visited = [Bool]()
var answer: Int64 = 0

func dfs(_ parent: Int) {
    visited[parent] = true
    for child in adj[parent] {
        if visited[child] { continue }
        dfs(child)
        let c = cost[child]
        answer += abs(c)
        cost[parent] += c
        cost[child] = 0
    }
}

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    cost = a.map { Int64($0) }
    var sum = cost.reduce(0, +)
    if sum != 0 { return -1 }
    adj = [[Int]](repeating: [], count: a.count)
    visited = [Bool](repeating: false, count: a.count)
    for edge in edges {
        adj[edge[0]].append(edge[1])
        adj[edge[1]].append(edge[0])
    }
    var root = 0
    for (i, v) in adj.enumerated() {
        if adj[root].count < adj[i].count { root = i }
    }
    dfs(root)
    return answer
}