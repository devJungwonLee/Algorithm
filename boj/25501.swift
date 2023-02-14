var cnt = 0

func recursion(_ a: [String], _ left: Int, _ right: Int) -> Bool {
    cnt += 1
    if left >= right { return true }
    if a[left] != a[right] { return false }
    return recursion(a, left + 1, right - 1)
}

func isPalindrome(_ s: String) -> Int {
    cnt = 0
    let result = recursion(s.map { String($0) }, 0, s.count - 1)
    return result ? 1 : 0
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!
    let r = isPalindrome(s)
    print(r, cnt)
}
