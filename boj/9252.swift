let s1 = readLine()!.map { String($0) }
let s2 = readLine()!.map { String($0) }
var d = [[Int]](repeating: [Int](repeating: 0, count: s2.count), count: s1.count)
for i in d.indices {
    for j in d[0].indices {
        var result = 0
        if s1[i] == s2[j] { result += 1 }
        if i>0 { result = max(result, d[i-1][j]) }
        if j>0 { result = max(result, d[i][j-1]) }
        if s1[i] == s2[j] && i>0 && j>0 { result = max(result, d[i-1][j-1]+1) }
        d[i][j] = result
    }
}
var row = s1.count - 1
var col = s2.count - 1
var stack = [String]()
print(d[row][col])
while true {
    if s1[row] == s2[col] {
        stack.append(s1[row])
        if d[row][col] == 1 { break }
        row -= 1
        col -= 1
    } else {
        if row == 0 && col == 0 { break }
        else if row == 0 { col -= 1 }
        else if col == 0 { row -= 1 }
        else if d[row-1][col] > d[row][col-1] { row -= 1 }
        else { col -= 1 }
    }
}
if !stack.isEmpty { print(stack.reversed().reduce("", +)) }
