let n = Int(readLine()!)!
for _ in 0..<n {
    var s = ""
    readLine()!.forEach {
        if let last = s.last, last == $0 { return }
        s += String($0)
    }
    print(s)
}