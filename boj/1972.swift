while true {
    let s = readLine()!.map { String($0) }
    if s == ["*"] { break }
    var flag = true
    for d in 1..<s.count {
        var pairs = Set<String>()
        for i in 0..<(s.count-d) {
            let t = s[i] + s[i+d]
            if pairs.contains(t) { 
                flag = false
                break
            } else { pairs.insert(t) }
        }
        if !flag { break }
    }
    if flag { print("\(s.joined()) is surprising.") }
    else { print("\(s.joined()) is NOT surprising.") }
}
