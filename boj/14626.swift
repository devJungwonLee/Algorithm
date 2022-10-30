let s = readLine()!.map { String($0) }
var sum = 0
var j = 0
(0..<s.count).forEach { i in
    if let num = Int(s[i]) {
        sum = (sum + (num * (i % 2 == 0 ? 1 : 3) % 10)) % 10
    } else {
        j = i
    }
}
sum = (10 - sum) % 10
for r in 0...9 {
    if r * (j % 2 == 0 ? 1 : 3) % 10 == sum {
        print(r)
        break
    }
}
