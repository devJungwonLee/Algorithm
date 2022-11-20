while true {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    let n = s[0]
    if n == 0 { break }
    let p = s[1]
    var a = [Int]()
    if p % 2 == 0 { 
        a = [p-1, n+1-p, n+2-p].sorted()
    } else {
        a = [p+1, n+1-p, n-p].sorted()
    }
    print(a.map { String($0) }.joined(separator: " "))
}
