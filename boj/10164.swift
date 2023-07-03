var comb = [[Int]](repeating: [Int](repeating: 0, count: 29), count: 29)
for i in 0...28 {
    for j in 0...i {
        if j == 0 || j == i { comb[i][j] = 1 }
        else { comb[i][j] = comb[i-1][j-1] + comb[i-1][j] }
    }
}
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let k = input[2]
if k == 0 { print(comb[n - 1 + m - 1][n - 1]) }
else {
    let r = (k - 1) / m
    let c = (k - 1) % m
    print(comb[r + c][r] * comb[n - 1 - r + m - 1 - c][n - 1 - r])
}