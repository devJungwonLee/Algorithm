import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var score = score.sorted()
    let r = score.count % m
    var i = r
    var answer = 0
    while i < score.count {
        answer += score[i] * m
        i += m
    }
    return answer
}