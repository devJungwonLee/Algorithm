let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var a = [Int](repeating: 0, count: n + 1)
var p = 1
var answer = 0
for i in 1...n {
    a[i] = Int(readLine()!)!
}
for i in 1...m {
    let dice = Int(readLine()!)!
    if p >= n { continue }
    p += dice
    if p >= n { 
        answer = i
        continue
    }
    p += a[p]
    if p >= n { 
        answer = i
        continue
    }
}
print(answer)