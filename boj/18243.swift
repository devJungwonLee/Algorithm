let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var d = [[Int]](repeating: [Int](repeating: 10000, count: n + 1), count: n + 1)
for i in 1...n { d[i][i] = 0 }
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    d[input[0]][input[1]] = 1
    d[input[1]][input[0]] = 1
}
for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            let sum = d[i][k] + d[k][j]
            if sum < d[i][j] {
                d[i][j] = sum
                d[j][i] = sum
            }
        }
    }
}
var isSmall = true
for i in 1...n {
    for j in 1...n {
        if d[i][j] > 6 { 
            isSmall = false
            break
        }
    }
    if !isSmall { break }
}
isSmall ? print("Small World!") : print("Big World!")