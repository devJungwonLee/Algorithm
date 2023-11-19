let n = Int(readLine()!)!
for i in 0..<n {
    let s1 = readLine()!
    let s2 = readLine()!
    var d1 = [Character: Int]()
    var d2 = [Character: Int]()
    for c in s1 { 
        if let x = d1[c] { d1[c] = x + 1 }
        else { d1[c] = 1 }
    }
    for c in s2 {
        if let x = d2[c] { d2[c] = x + 1 }
        else { d2[c] = 1 }
    }
    var sum = 0
    for c in Set(d1.keys).union(Set(d2.keys)) {
        sum += abs((d1[c] ?? 0) - (d2[c] ?? 0))
    }
    print("Case #\(i + 1): \(sum)")
}