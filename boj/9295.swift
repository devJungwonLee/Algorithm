let t = Int(readLine()!)!
for i in 0..<t {
    print("Case \(i+1): \(readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +))")
}
