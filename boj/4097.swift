import Foundation

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    var a = [Int]()
    for _ in 0..<n {
        let x = Int(readLine()!)!
        if a.isEmpty { a.append(x) }
        else { 
            let sum = a.last!
            if sum + x <= x {
                a.removeLast()
                a.append(x)
            } else {
                a.append(sum + x)
            }
        }
    }
    print(a.max()!)
}