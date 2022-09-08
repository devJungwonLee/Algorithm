let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int](repeating: 0, count: n)
var next = [Int](repeating: 0, count: n)
for i in (0..<n).reversed() {
    var maxValue = 1
    for j in ((i+1)..<n) {
        if a[i] >= a[j] { continue }
        if 1 + d[j] > maxValue {
            maxValue = 1 + d[j]
            next[i] = j
        }
    }
    d[i] = maxValue
}
let maxIndex = d.indices.max { d[$0] < d[$1] }!
print(d[maxIndex])
var index = maxIndex
while true {
    print(a[index], terminator: " ")
    if next[index] <= index { break }
    else { index = next[index] }
}
print("")