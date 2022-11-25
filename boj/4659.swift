func isVowel(_ c: String) -> Bool {
    let vowels: Set<String> = ["a", "e", "i", "o", "u"]
    return vowels.contains(c)
}

func check(_ s: String) -> Bool {
    let str = s.map { String($0) }
    var flag = false
    for i in 0..<str.count {
        if i < str.count - 2 {
            let a = isVowel(str[i])
            let b = isVowel(str[i+1])
            let c = isVowel(str[i+2])
            if a == b && b == c { return false }
        }
        if i < str.count - 1 {
            if str[i] != "e" && str[i] != "o" && str[i] == str[i+1] {
                return false
            }
        }
        if isVowel(str[i]) { flag = true }
    }
    return flag
}

while true {
    let s = readLine()!
    if s == "end" { break }
    if check(s) { print("<\(s)> is acceptable.") }
    else { print("<\(s)> is not acceptable.") }
}
