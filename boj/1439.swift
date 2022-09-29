let s = readLine()!.map { String($0) }
var zero = 0
var one = 0
for i in 1..<s.count {
    if s[i] != s[i-1] {
        if s[i-1] == "0" { zero += 1 }
        else { one += 1 }
    }
}
if s[s.count-1] == "0" { zero += 1 }
else { one += 1 }
print(min(zero, one))
