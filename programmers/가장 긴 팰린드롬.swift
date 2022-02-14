import Foundation

func solution(_ s:String) -> Int {
    let s = s.map { String($0) }
    var odd = 0
    var even = 0
    for i in 0..<s.count {
        var k = 0
        while true {
            if i - k - 1 < 0 || i + k + 1 >= s.count { break }
            if s[i - k - 1] != s[i + k + 1] { break }
            k += 1
        }
        odd = max(odd, k)
        k = 0
        while true {
            if i - k < 0 || i + k + 1 >= s.count { break }
            if s[i - k] != s[i + k + 1] { break }
            k += 1
        }
        even = max(even, k)
    }
    return max(2 * odd + 1, 2 * even)
}