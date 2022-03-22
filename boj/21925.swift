import Foundation

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
var d1 = [Int: Bool]()
var d2 = [Int: Int]()

func checkPalindrome(_ start: Int, _ end: Int) -> Bool {
    if let result = d1[start * n + end] {
        return result
    }
    var i = start
    var j = end
    while i < j {
        if a[i] != a[j] {
            d1[start * n + end] = false
            return false
        }
        i += 1
        j -= 1
    }
    d1[start * n + end] = true
    return true
}

func findMax(_ start: Int, _ end: Int) -> Int {
    if start == end + 1 { return 0 }
    if let result = d2[start * n + end] {
        return result
    }
    var result = 0
    var mid = start + 2
    while mid <= a.count {
        if checkPalindrome(start, mid - 1) {
            result = max(result, 1 + findMax(mid, end))
        }
        mid += 2
    }
    if result == 0 {
        d2[start * n + end] = -1
        return -1
    }
    else {
        d2[start * n + end] = result
        return result
    }
}

let result = findMax(0, a.count - 1)
print(result)