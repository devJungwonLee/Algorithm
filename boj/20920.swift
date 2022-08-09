import Foundation

let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var cnt = [String: Int]()
for _ in 0..<n {
    let word = readLine()!
    if word.count < m { continue }
    if cnt.keys.contains(word) { cnt[word] = cnt[word]! + 1 }
    else { cnt[word] = 1 }
}
let answer = cnt.keys.sorted { lhs, rhs in
    if cnt[lhs]! == cnt[rhs]! {
        if lhs.count == rhs.count {
            return lhs < rhs
        }
        return lhs.count > rhs.count
    }
    return cnt[lhs]! > cnt[rhs]!
}
for word in answer { print(word) }