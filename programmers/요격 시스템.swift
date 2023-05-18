import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted { $0[1] < $1[1] }
    var e = 0
    var answer = 0
    for target in targets {
        if target[0] >= e {
            e = target[1]
            answer += 1
        }
    }
    return answer
}