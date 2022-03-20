import Foundation

func check(_ num: Int) -> Bool {
    let numStr = String(num).map { String($0) }
    for c in numStr {
        if c != "5", c != "8" { return false }
    }
    return true
}

let T = Int(readLine()!)!
for _ in 0..<T {
    var s = Set<Int>()
    let A = Int(readLine()!)!
    let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let B = Int(readLine()!)!
    let b = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let C = Int(readLine()!)!
    let c = readLine()!.components(separatedBy: " ").map { Int($0)! }
    for i in 0..<A {
        for j in 0..<B {
            for k in 0..<C {
                let num = a[i] + b[j] + c[k]
                if check(num) { s.insert(num) }
            }
        }
    }
    print(s.count)
} 