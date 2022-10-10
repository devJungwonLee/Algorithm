let s = readLine()!.split(separator: " ").map { Int($0)! }
let N = s[0]
let m = s[1]
let M = s[2]
let T = s[3]
let R = s[4]
var t = 0
var current = m
var cnt = 0
if m + T <= M {
    while true {
        t += 1
        if current + T <= M {
            current += T
            cnt += 1
            if cnt == N { break }
        } else {
            current = max(current-R, m)
        }
    }
    print(t)
} else {
    print("-1")
}
