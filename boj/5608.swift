var d = [String: String]()
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { String($0) }
    d[s[0]] = s[1]
}
var answer = ""
let m = Int(readLine()!)!
for _ in 0..<m {
    let s = readLine()!
    if let c = d[s] {
        answer += c
    } else {
        answer += s
    }
}
print(answer)
