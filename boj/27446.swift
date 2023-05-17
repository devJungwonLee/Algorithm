let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var pages = Set<Int>(readLine()!.split(separator: " ").map { Int($0)! })
var d = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)
d[0][0] = 5
pages.insert(0)
for i in 1...n {
    if pages.contains(i-1) {
        d[i][0] = min(d[i-1][0] + 2, d[i-1][1] + 7)
    } else {
        d[i][0] = d[i-1][0] + 2
    }
    
    if pages.contains(i) {
        if pages.contains(i-1) {
            d[i][1] = min(d[i-1][0], d[i-1][1])
        } else {
            d[i][1] = d[i-1][0]
        }
    }
}
let answer = pages.contains(n) ? min(d[n][0], d[n][1]) : d[n][0]
print(answer)