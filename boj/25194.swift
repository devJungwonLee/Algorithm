

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(($0))! % 7 }
var d = [Int](repeating: 0, count: 7)
var isSuccess = false

func recursive(_ index: Int, _ numbers: [Int]) {
    if isSuccess { return }
    if index == 7 {
        var sum = 0
        numbers.enumerated().forEach { sum += $0 * $1 }
        if sum % 7 == 4 { isSuccess = true }
        return
    }
    for i in 0...d[index] {
        recursive(index + 1, numbers + [i])
    }
}

for x in a { d[x] = (d[x] + 1) % 7 }
if d[4] > 0 { print("YES") }
else {
    recursive(0, [])
    isSuccess ? print("YES") : print("NO")
}