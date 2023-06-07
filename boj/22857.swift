let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let s = readLine()!.split(separator: " ").map { Int($0)! }
var d = [[Int]](repeating: [Int](repeating: -1, count: k + 1), count: n + 1)
var answer = 0
d[0][0] = 0
for i in 1...n {
    for j in 0...k {
        if s[i-1] % 2 == 1 {
            if j - 1 >= 0, d[i-1][j-1] != -1 {
                d[i][j] = d[i-1][j-1]
            }
        } else {
            if d[i-1][j] != -1 { d[i][j] = d[i-1][j] + 1 }
            else if j == 0 { d[i][j] = 1 }
            answer = max(answer, d[i][j])
        }
    }
}
print(answer)