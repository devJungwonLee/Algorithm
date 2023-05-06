import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var i = 0
    var answer: Int64 = 0
    while i <= d {
        let r = Int64(sqrt(Double(d * d - i * i)))
        answer += (r / Int64(k) + 1)
        i += k
    }
    return answer
}