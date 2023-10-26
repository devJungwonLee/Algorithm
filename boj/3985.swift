_ = Int(readLine()!)!
let n = Int(readLine()!)!
var a = [Int]()
var b = [Int]()
var s = Set<Int>()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let p = input[0]
    let k = input[1]
    var count = 0
    for i in p...k {
        if s.contains(i) { continue }
        s.insert(i)
        count += 1
    }
    a.append(k - p + 1)
    b.append(count)
}
print(a.firstIndex { $0 == a.max()! }! + 1)
print(b.firstIndex { $0 == b.max()! }! + 1)