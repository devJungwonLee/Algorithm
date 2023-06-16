let t = Int(readLine()!)!
var a = [Int]()
var maxValue = 0
for _ in 0..<t {
    let num = Int(readLine()!)!
    a.append(num)
    maxValue = max(maxValue, num)
}
var d = [Int](repeating: 0, count: maxValue + 1)
for i in 1...maxValue {
    if i == 1 { d[i] = 1 }
    else if i == 2 { d[i] = 2 }
    else { d[i] = (d[i-2] + d[i-1]) % 1000000007 }
}
a.forEach { print(d[$0]) }