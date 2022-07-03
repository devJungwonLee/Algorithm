import Foundation
let s = readLine()!.map { String($0) }
var cnt = [String: Int]()
var answer = ""
var mid = ""
for c in s {
    if let num = cnt[c] {
        cnt[c] = num + 1;
    } else {
        cnt[c] = 1;
    }
}
if cnt.values.filter({ $0 % 2 != 0 }).count > 1 {
    print("I'm Sorry Hansoo")
} else {
    cnt.keys.sorted().forEach {
        let num = cnt[$0]!
        if num % 2 != 0 { mid = $0 }
        for _ in 0..<(num/2) { answer += $0 }
    }
    answer = answer + mid + String(answer.reversed())
    print(answer)
}