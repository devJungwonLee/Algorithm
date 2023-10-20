let n = Int(readLine()!)!
let m = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int: [Int]]()
for i in 0..<a.count {
    let x = a[i]
    if let v = d[x] {
        d[x] = [v[0] + 1, v[1]]
    } else {
        if d.keys.count == n {
            let minKey = d.keys.min { 
                if d[$0]![0] == d[$1]![0] {
                    return d[$0]![1] < d[$1]![1]
                }
                return d[$0]![0] < d[$1]![0]
            }!
            d.removeValue(forKey: minKey)
        }
        d[x] = [1, i]
    }
}
print(d.keys.sorted().map { String($0) }.joined(separator: " "))