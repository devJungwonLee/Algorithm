import Foundation

var n = 0
var adj = [[Int]]()
var leaves = [Int]()
var infos = [Int: [Int]]()

func simulate() {
    var road = [Int](repeating: 0, count: n + 1)
    var cnt = 0
    var index = 0
    while cnt < leaves.count * 2 {
        var current = 1
        while !adj[current].isEmpty {
            let next = adj[current][road[current]]
            road[current] = (road[current] + 1) % adj[current].count
            current = next
        }
        if let info = infos[current] {
            if info.count == 1 {
                infos[current] = [info[0], index - info[0]]
                cnt += 1
            }
        } else {
            infos[current] = [index]
            cnt += 1
        }
        index += 1
    }
}

func drop(_ target: [Int], _ end: Int) -> [Int] {
    var result = [Int]()
    var road = [Int](repeating: 0, count: n + 1)
    var sum = [Int](repeating: 0, count: n)
    
    for i in 0...end {
        var current = 1
        while !adj[current].isEmpty {
            let next = adj[current][road[current]]
            road[current] = (road[current] + 1) % adj[current].count
            current = next
        }
        let first = infos[current]![0]
        let diff = infos[current]![1]
        let maximum = (end - i) / diff * 3
        let remain = target[current - 1] - sum[current - 1]
        if remain == 0 { 
            if target[current - 1] != 0 { return [-1] }
            continue
        }
        if remain - 1 <= maximum {
            sum[current - 1] += 1
            result.append(1)
        } else if remain - 2 <= maximum {
            sum[current - 1] += 2
            result.append(2)
        } else {
            sum[current - 1] += 3
            result.append(3)
        }
    }
    return result
}

func solution(_ edges:[[Int]], _ target:[Int]) -> [Int] {
    n = target.count
    adj = [[Int]](repeating: [], count: n + 1)
    for edge in edges { adj[edge[0]].append(edge[1]) }
    for i in 1...n { adj[i].sort() }
    leaves = (1...n).filter { adj[$0].isEmpty }
    simulate()
    let end = leaves.map { (leaf: Int) -> Int in
        let cnt = (target[leaf - 1] - 1) / 3
        let first = infos[leaf]![0]
        let diff = infos[leaf]![1]
        let index = target[leaf - 1] == 0 ? 0 : first + diff * cnt
        return index
    }.max()!
    return drop(target, end)
}