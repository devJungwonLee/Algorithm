import Foundation
while let input = readLine()?.split(separator:" ").map({ Int($0)! }) {
    let (b, n) = (input[0], input[1])
    if b == 0 && n == 0 { break }
    var x = 1
    while true {
        let current = Int(pow(Double(x), Double(n)))
        let next = Int(pow(Double(x + 1), Double(n)))
        if abs(current - b) < abs(next - b) { break }
        x += 1
    }
    print(x)
}