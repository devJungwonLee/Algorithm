let n = Int(readLine()!)!
for _ in 0..<n {
    let point = readLine()!.map { Int(UnicodeScalar(String($0))!.value) - 64 }.filter { $0 > 0 }.reduce(0, +)
    point == 100 ? print("PERFECT LIFE") : print(point)
}