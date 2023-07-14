let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var b = [Int]()
for i in 0..<(n-1) {
    if a[i] > a[i+1] { b.append(i) }
}
if b.count > 1 { print("0") }
else if b.count < 1 { print(n) }
else {
    let index = b[0]
    var answer = 0
    if index == 0 || a[index-1] <= a[index+1] { answer += 1 }
    if index == n - 2 || a[index] <= a[index+2] { answer += 1 }
    print(answer)
}