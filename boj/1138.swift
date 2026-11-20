import Foundation

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
var x = Array(1...n)
var done = false

func rotate(_ index: Int) {
    if done { return }
    let n = x.count
    if index == n - 1 {
        for i in 1...n {
            var count = 0
            for j in 0..<n {
                if x[j] > i { count += 1 }
                else if x[j] == i { break }
            }
            if count != a[i - 1] { return }
        }
        print(x.map { String($0) }.joined(separator: " "))
        done = true
        return
    } else {
        for i in index..<n {
            x.swapAt(index, i)
            rotate(index + 1)
            x.swapAt(index, i)
        }
    }
}

rotate(0)