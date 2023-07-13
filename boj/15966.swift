let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int: Int]()
var answer = 0
for x in a {
    if x == 1 { d[x] = 1 }
    else if let y = d[x-1] {
        d[x] = y + 1
    } else {
        d[x] = 1
    }
    answer = max(answer, d[x]!)
}
print(answer)