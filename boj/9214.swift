var num = 1
while let s = readLine() {
    if s == "0" { break }
    var current = s
    while current.count % 2 == 0 {
        var next = ""
        let temp = current.map { String($0) }
        var i = 0
        while i < temp.count {
            next += String(repeating: temp[i+1], count: Int(temp[i])!)
            i += 2
        }
        if current == next { break }
        current = next
    }
    print("Test \(num): \(current)")
    num += 1
}
