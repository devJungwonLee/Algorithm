import Foundation
let price = [350.34, 230.90, 190.55, 125.30, 180.90]
let n = Int(readLine()!)!
for _ in 0..<n { 
    let input = readLine()!.split(separator: " ").map { Double($0)! }
    let total = (0..<5).map { input[$0] * price[$0] }.reduce(0, +)
    print(String(format: "$%.2f", total))
}