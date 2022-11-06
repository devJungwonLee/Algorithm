let n = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0
for i in 0..<n {
    for j in 0..<n {
        sum += abs(x[i]-x[j])
    }
}
print(sum)
