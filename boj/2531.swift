let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let d = s[1]
let k = s[2]
let c = s[3]
var a = [Int]()
for _ in 0..<n { a.append(Int(readLine()!)!) }
var sushis = [Int: Int]()
var answer = 0
for i in 0..<k {
    if let cnt = sushis[a[i]] {
        sushis[a[i]] = cnt + 1
    } else {
        sushis[a[i]] = 1
    }
}
for i in 0..<n {
    var tmp = 0
    if !sushis.keys.contains(c) { tmp += 1 }
    tmp += sushis.keys.count
    answer = max(answer, tmp)
    if let cnt = sushis[a[i]] {
        if cnt == 1 { sushis.removeValue(forKey: a[i]) }
        else { sushis[a[i]] = cnt - 1 }
    }
    if let cnt = sushis[a[(i+k)%n]] {
        sushis[a[(i+k)%n]] = cnt + 1
    } else {
        sushis[a[(i+k)%n]] = 1
    }
}
print(answer)
