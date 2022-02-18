import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var current = 1
    var answer = 0
    for station in stations {
        let start = station - w
        let end = station + w
        if current < start { 
            let q = (start - current) / (2 * w + 1)
            let r = (start - current) % (2 * w + 1)
            answer += q + (r == 0 ? 0 : 1)
        }
        current = end + 1
    }
    if (current <= n) {
        let q = (n - current + 1) / ( 2 * w + 1)
        let r = (n - current + 1) % ( 2 * w + 1)
        answer += q + (r == 0 ? 0 : 1)
    }
    return answer
}