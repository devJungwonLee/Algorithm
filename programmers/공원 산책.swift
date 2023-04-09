import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var p = [0, 0]
    var dir = ["E": [0, 1], "W": [0, -1], "N": [-1, 0], "S": [1, 0]];
    var park = park.map { $0.map { String($0) } }
    for i in 0..<park.count {
        for j in 0..<park[i].count {
            if park[i][j] == "S" {
                p = [i, j]
                break
            }
        }
    }
    routes.forEach {
        let s = $0.components(separatedBy: " ")
        let d = dir[s[0]]!
        for i in 1...Int(s[1])! {
            let newr = p[0] + d[0] * i
            let newc = p[1] + d[1] * i
            guard (0..<park.count) ~= newr, (0..<park[0].count) ~= newc else {
                return
            }
            if park[newr][newc] == "X" { return }
        }
        let newr = p[0] + d[0] * Int(s[1])!
        let newc = p[1] + d[1] * Int(s[1])!
        p = [newr, newc]
    }
    return p
}