let t = Int(readLine()!)!
var d = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 10001)
var a = [Int]()
var m = 0
for _ in 0..<t {
    let num = Int(readLine()!)!
    a.append(num)
    m = max(m, num)
}
d[1][1] = 1
d[1][2] = 1
d[1][3] = 1
d[2][1] = 1
d[2][2] = 2
d[2][3] = 2
d[3][1] = 1
d[3][2] = 2
d[3][3] = 3
if m >= 4 {
    for i in 4...m {
        d[i][1] = 1
        d[i][2] = d[i][1] + d[i-2][2]
        d[i][3] = d[i][2] + d[i-3][3]
    }
}
a.forEach { print(d[$0][3]) }
