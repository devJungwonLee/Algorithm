let n = Int(readLine()!)!
let s = readLine()!.map { String($0) }
var a = [0]
var i = 0
while i <= n - 4 {
    let four = s[i..<(i + 4)].reduce("", +)
    if four == "long" {
        a.append(1)
        i += 4
        continue
    } else if a.last! != 0 { 
        a.append(0)
    }
    i += 1
}
var d = [Int](repeating: 0, count: a.count)
d[0] = 1
for i in 1..<d.count {
    if a[i] == 0 || a[i-1] == 0 { d[i] = d[i-1] }
    else { d[i] = d[i-1] + d[i-2] }
}
print(d.last!)