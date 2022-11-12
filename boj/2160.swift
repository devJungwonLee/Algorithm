var a = [[[String]]]()
let n = Int(readLine()!)!
for _ in 0..<n {
    var temp = [[String]]()
    for _ in 0..<5 {
        let s = readLine()!.map { String($0) }
        temp.append(s)
    }
    a.append(temp)
}
var pairs = [[Int]]()
for i in 0..<n {
    for j in (i+1)..<n {
        pairs.append([i, j])
    }
}
func difference(_ x: [[String]], _ y: [[String]]) -> Int {
    var cnt = 0
    for i in 0..<5 {
        for j in 0..<7 {
            if x[i][j] != y[i][j] { cnt += 1 }
        }
    }
    return cnt
}

let answer = pairs.min { difference(a[$0[0]], a[$0[1]]) < difference(a[$1[0]], a[$1[1]])  }!.map { $0 + 1 }
print(answer[0], answer[1])
