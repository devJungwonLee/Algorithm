import Foundation

func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
    let land = land.flatMap { $0 }.sorted()
    var cost: Int64 = 0
    for i in 0..<land.count { cost += Int64(land[i] - land[0]) }
    cost *= Int64(q)
    var answer = cost
    for i in 1..<land.count {
        if land[i] == land[i-1] { continue }
        cost -= Int64(land.count - i) * Int64(land[i] - land[i-1]) * Int64(q)
        cost += Int64(i) * Int64(land[i] - land[i-1]) * Int64(p)
        if cost >= answer { break }
        else { answer = cost }
    }
    return answer
}