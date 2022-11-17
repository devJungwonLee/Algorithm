let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    if s[0] < s[1] { print("NO BRAINS") }
    else { print("MMM BRAINS") }
}
