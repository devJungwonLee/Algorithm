let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = min(s[0], s[1])
let m = max(s[0], s[1])
let t = s[2]
var a = [[Int]]()
for y in 0...t/m {
    let x = (t - y*m)/n
    let z = (t - y*m)%n
    a.append([x, y, z])
}
let answer = a.min { lhs, rhs in
    if lhs[2] == rhs[2] {
        return lhs[0]+lhs[1] > rhs[0]+rhs[1]
    }
    return lhs[2] < rhs[2]
}!
print(answer[0]+answer[1], answer[2])

