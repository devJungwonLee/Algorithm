import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var t = t.map { String($0) }
    var p = p.map { String($0) }
    var cnt = 0
    for i in 0...(t.count - p.count) {
        let sub = Array(t[i..<(i + p.count)])
        let subNum = Int64(sub.reduce("", +))!
        let pNum = Int64(p.reduce("", +))!
        if subNum <= pNum {
            cnt += 1
        }
    }
    return cnt
}