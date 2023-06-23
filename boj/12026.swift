let n = Int(readLine()!)!
let s = readLine()!.map { String($0) }
var d = [Int](repeating: Int.max, count: n)
var index = ["B": 0, "O": 1, "J": 2]
d[0] = 0
for i in 0..<n {
    let indexI = index[s[i]]!
    for j in 0..<i {
        let indexJ = index[s[j]]!
        if (indexJ + 1) % 3 == indexI, d[j] != Int.max {
            d[i] = min(d[i], d[j] + (i - j) * (i - j))
        }
    }
}
print(d[n-1] == Int.max ? -1 : d[n-1])