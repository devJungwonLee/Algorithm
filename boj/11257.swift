import Foundation

func isPass(_ s: [Int]) -> Bool {
    if s[1] < 11 { return false }
    if s[2] < 8 { return false }
    if s[3] < 12 { return false }
    if s[1] + s[2] + s[3] < 55 { return false }
    return true
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let result = isPass(s) ? "PASS" : "FAIL"
    print(s[0], s[1]+s[2]+s[3], result)
}