var factorials = [Int64]()
var n: Int64  = 0
var success = false

func recursive(_ depth: Int, _ indices: [Int]) {
    if success { return }
    if depth == 21 {
        let sum: Int64 = indices.map { factorials[$0] }.reduce(0, +)
        if sum == n { success = true }
        return
    }
    recursive(depth + 1, indices)
    recursive(depth + 1, indices + [depth])
}

(0...20).forEach { number in
    var factorial: Int64 = 1
    if number > 0 { (1...number).forEach { factorial *= Int64($0) } }
    factorials.append(factorial)
}

n = Int64(readLine()!)!
if n == 0 {
    success = false
} else {
    recursive(0, [])
}
success ? print("YES") : print("NO")
