let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [[Int]](repeating: [0, 0], count: a.count)
var answer = 0
for i in 0..<a.count {
    if a[i] > k {
        if i == 0 {
            d[i][0] = 1
            d[i][1] = 2
        } else {
            d[i][0] = 1
            d[i][1] = d[i-1][0] + 1
        }
    } else {
        if i == 0 { 
            d[i][0] = 2
            d[i][1] = 2
        } else { 
            d[i][0] = d[i-1][0] + 1
            d[i][1] = max(d[i-1][0] + 1, d[i-1][1] + 1)
        }
    }
    answer = max(answer, d[i][0], d[i][1])
}
print(answer)