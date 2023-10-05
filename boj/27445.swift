var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var d = [[Int]: Int]()
if n > 1 {
    for i in 1...(n - 1) {
        let num = Int(readLine()!)!
        d[[i, 1]] = num
    }
}
input = readLine()!.split(separator: " ").map { Int($0)! }
for j in 0..<m {
    d[[n, j + 1]] = input[j]
}
var answer = [Int]()
for i in 1...n {
    for j in 1...m {
        var flag = true
        for (p, x) in d {
            let y = abs(i - p[0]) + abs(j - p[1])
            if x != y {
                flag = false
                break
            }
        }
        if flag { 
            answer = [i, j]
            break
        }
    }
    if !answer.isEmpty { break }
}
print(answer[0], answer[1])