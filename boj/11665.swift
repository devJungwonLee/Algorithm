let n = Int(readLine()!)!
var a = [0, 0, 0, 1001, 1001, 1001]
for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    a[0] = max(a[0], s[0])
    a[1] = max(a[1], s[1])
    a[2] = max(a[2], s[2])
    a[3] = min(a[3], s[3])
    a[4] = min(a[4], s[4])
    a[5] = min(a[5], s[5])
}
let answer = max(0, (a[3]-a[0])*(a[4]-a[1])*(a[5]-a[2]))
print(answer)
