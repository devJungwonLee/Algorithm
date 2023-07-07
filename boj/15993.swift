let mod = 1000000009
let t = Int(readLine()!)!
var numbers = [Int]()
for _ in 0..<t {
    numbers.append(Int(readLine()!)!)
}
let n = max(3, numbers.max()!)
var d = [[Int]](repeating: [0, 0], count: n + 1)
d[1][1] = 1
d[2][1] = 1
d[2][0] = 1
d[3][1] = 2
d[3][0] = 2
for i in 4...n {
    for j in 1...3 {
        d[i][0] = (d[i][0] + d[i-j][1]) % mod
        d[i][1] = (d[i][1] + d[i-j][0]) % mod
    }
}
numbers.forEach { 
    print(d[$0][1], d[$0][0])
}