import Foundation

func solution(_ scores:[[Int]]) -> Int {
    let wanho = scores[0]
    var scores = scores.filter { $0[0] + $0[1] > wanho[0] + wanho[1] }
    if scores.isEmpty { return 1 }
    scores = scores.sorted { lhs, rhs in
        if lhs[1] == rhs[1] { return lhs[0] < rhs[0] }
        return lhs[1] > rhs[1]
    }
    var count = 0
    var high = scores[0]
    for score in scores {
        if score[1] == high[1] {
            high = score
        } else {
            if score[0] > high[0] { high = score }
            else if score[0] < high[0] { count += 1 }
        }
        if wanho[0] < high[0] && wanho[1] < high[1] { return -1 }
    }
    return scores.count - count + 1
}