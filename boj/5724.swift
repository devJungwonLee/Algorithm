while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    print(n * (n + 1) * (2 * n + 1) / 6)
}