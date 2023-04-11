import Foundation

func solution(_ s: String) -> Int {
    var s = s.map { String($0) }
    var cnt = 0
    var cnt1 = 0
    var cnt2 = 0 
    var x = ""
    for i in 0..<s.count {
        if x == "" {
            cnt1 += 1
            x = s[i]
        } else if s[i] == x {
            cnt1 += 1
        } else {
            cnt2 += 1
            if cnt1 == cnt2 {
                cnt += 1
                cnt1 = 0
                cnt2 = 0
                x = ""
            }
        }
    }
    if x != "" { cnt += 1 }
    return cnt
}