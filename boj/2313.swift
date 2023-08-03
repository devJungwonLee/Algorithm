let n = Int(readLine()!)!
var a = [[Int]]()
var s = [[Int]]()
for _ in 0..<n {
    _ = readLine()!
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var sum: Int64 = 0
var range = [String]()

for i in 0..<n {
    var d = [[Int]](repeating: [], count: a[i].count)
    d[0] = [0, 0, a[i][0]]
    for j in 1..<a[i].count {
        if d[j-1][2] > 0 {
            d[j] = [d[j-1][0], j, d[j-1][2] + a[i][j]]
        } else {
            d[j] = [j, j, a[i][j]]
        }
    }
    let max = d.max { 
        if $0[2] == $1[2] {
            if $0[1] - $0[0] == $1[1] - $1[0] {
                return false
            }
            return $0[1] - $0[0] > $1[1] - $1[0]
        }
        return $0[2] < $1[2]
    }!
    sum += Int64(max[2])
    range.append("\(max[0] + 1) \(max[1] + 1)")
}
print(sum)
range.forEach { print($0) }