import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var cnt = 1
    var start = section[0]
    for i in 0..<section.count {
        if section[i] >= start + m { 
            cnt += 1
            start = section[i]
        }
    }
    return cnt
}