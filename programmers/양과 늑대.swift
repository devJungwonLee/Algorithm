import Foundation

struct Comb: Hashable {
    let node: Int
    let visit: Set<Int>
}

var isSheep = [Bool]()
var adj = [[Int]]()
var s = Set<Comb>()
var answer = 0

func dfs(_ comb: Comb, _ sheep: Int, _ wolf: Int) {
    if s.contains(comb) { return }
    s.insert(comb)
    let node = comb.node
    var sheep = sheep
    var wolf = wolf
    if !comb.visit.contains(node) {
        if isSheep[node] { sheep += 1 }
        else { wolf += 1 }
    }
    if sheep == wolf { return }
    answer = max(answer, sheep)
    var newVisit = comb.visit
    newVisit.insert(node)
    for other in adj[node] {
        let newComb = Comb(node: other, visit: newVisit)
        dfs(newComb, sheep, wolf)
    }
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    isSheep = info.map { $0 == 0 }
    adj = [[Int]](repeating: [Int](), count: info.count)
    for edge in edges {
        adj[edge[0]].append(edge[1])
        adj[edge[1]].append(edge[0])
    }
    dfs(Comb(node: 0, visit: Set<Int>()), 0, 0)
    return answer
}