import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var points = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    for i in survey.indices {
        let p = choices[i] - 4
        if p < 0 {
            let type = String(survey[i].first!)
            points[type] = points[type]! - p
        } else {
            let type = String(survey[i].last!)
            points[type] = points[type]! + p
        }
    }
    var answer = ""
    answer += (points["R"]! >= points["T"]!) ? "R" : "T"
    answer += (points["C"]! >= points["F"]!) ? "C" : "F"
    answer += (points["J"]! >= points["M"]!) ? "J" : "M"
    answer += (points["A"]! >= points["N"]!) ? "A" : "N"
    return answer
}