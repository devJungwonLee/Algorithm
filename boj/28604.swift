let n = Int(readLine()!)!
var names = [String]()
var cnt = 0
for _ in 0..<n {
    names.append(readLine()!)
}

func canConnect(_ a: String, _ b: String) -> Bool {
    let m = min(a.count, b.count)
    let arrayA = a.map { String($0) }
    let arrayB = b.map { String($0) }
    for i in 1...m {
        let subA = arrayA[(a.count - i)..<a.count]
        let subB = arrayB[0..<i]
        if subA == subB { return true }
    }
    return false
}

for i in 0..<n {
    for j in (i+1)..<n {
        if canConnect(names[i], names[j]) || canConnect(names[j], names[i]) {
            cnt += 1
        }
    }
}

print(cnt)