let k = Int(readLine()!)!
var a = [[Int]]()
for _ in 0..<6 {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(s)
}
let width = a.filter { $0[0] >= 3 }.map { $0[1] }.max()!
let height = a.filter { $0[0] <= 2 }.map { $0[1] }.max()!
var answer = width * height
for i in 0..<6 {
    if a[i][0] == a[(i+2)%6][0] && a[(i+1)%6][0] == a[(i+3)%6][0] {
        answer -= a[(i+1)%6][1] * a[(i+2)%6][1]
    }
}
answer *= k
print(answer)
