import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var answer: Int64 = 0
    
    var y = -r2
    while y <= r2 {
        let x2 = sqrt(Double(r2 * r2 - y * y))
        let x1 = r1 * r1 - y * y >= 0 ? sqrt(Double(r1 * r1 - y * y)) : 0
        var cnt = (Int64(floor(x2)) - Int64(ceil(x1)) + 1) * 2
        if x1 == 0 { cnt -= 1 }
        answer += cnt
        y += 1
    }
    return answer
}