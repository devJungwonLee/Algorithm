let s = readLine()!.split(separator: " ").map { Int($0)! }
let d = s[0]
let k = s[1]
var f = [Int](repeating: 0, count: d)
for i in 0..<f.count {
    if i == 0 || i == 1 { f[i] = i }
    else { f[i] = f[i-1] + f[i-2] }
}
let x = f[d-2]
let y = f[d-1]
for b in 1... {
    let r = k - y * b
    if r % x != 0 { continue }
    let a = r / x
    if a > b { continue }
    print(a)
    print(b)
    break
}
