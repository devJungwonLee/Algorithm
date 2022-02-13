import Foundation

func check(_ str: String) -> Bool {
    guard let num = Int(str) else { return false }
    if num == 1 { return false }
    var i = 2
    while i * i <= num {
        if num % i == 0 { return false }
        i += 1
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    let str = String(n, radix: k).map { String($0) }
    var answer = 0
    var tmp = ""
    for c in str {
        if c == "0" {
            if check(tmp) { answer += 1 }
            tmp = ""
        } else { tmp += c }
    }
    if (check(tmp)) { answer += 1 }
    return answer
}