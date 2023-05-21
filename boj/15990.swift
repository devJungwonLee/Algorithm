var maxValue = 0
var numbers = [Int]()
let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    numbers.append(n)
    maxValue = max(maxValue, n)
}
maxValue = max(maxValue, 3)
var d = [[Int]](repeating: [Int](repeating: 0, count: 4), count: maxValue + 1)
d[1][1] = 1
d[2][2] = 1
d[3][1] = 1
d[3][2] = 1
d[3][3] = 1
if maxValue > 3 {
    for i in 4...maxValue {
        d[i][1] = (d[i-1][2] + d[i-1][3]) % 1000000009
        d[i][2] = (d[i-2][1] + d[i-2][3]) % 1000000009
        d[i][3] = (d[i-3][1] + d[i-3][2]) % 1000000009
    }
}
numbers.forEach {
    print((d[$0][1] + d[$0][2] + d[$0][3]) % 1000000009)
}