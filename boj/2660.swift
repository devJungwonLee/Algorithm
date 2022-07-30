import Foundation

let n = Int(readLine()!)!
var d = [[Int]](
    repeating: [Int](
        repeating: 100,
        count: n
    ),
    count: n
)
for i in 0..<n {
    d[i][i] = 0
}

while true {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    if s[0] == -1 && s[1] == -1 { break }
    d[s[0]-1][s[1]-1] = 1
    d[s[1]-1][s[0]-1] = 1
}
for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if d[i][k] != 100 && d[k][j] != 100 {
                d[i][j] = min(d[i][j], d[i][k] + d[k][j])
            }
        }
    }
}
let points = d.map { $0.max()! }
let presidentPoint = points.min()!
let candidates = points.indices.filter { points[$0] == presidentPoint }.map { $0 + 1 }
print(presidentPoint, candidates.count)
for candidate in candidates {
    print(candidate, terminator: " ")
}
print("")