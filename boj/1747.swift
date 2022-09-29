let n = Int(readLine()!)!

func isPrime(_ num: Int) -> Bool {
    if num == 1 { return false }
    var i = 2
    while i * i <= num {
        if num % i == 0 { return false }
        i += 1
    }
    return true
}

func isPalindrome(_ num: Int) -> Bool {
    let s = String(num).map { String($0) }
    for i in 0..<(s.count / 2) {
        if s[i] != s[s.count-1-i] { return false }
    }
    return true
}

for i in n...Int.max {
    if !isPrime(i) { continue }
    if isPalindrome(i) {
        print(i)
        break
    }
}
