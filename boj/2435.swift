let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let a = readLine()!.split(separator: " ").map { Int($0)! }
var b = [0]
for i in 0..<a.count {
    b.append(b[i] + a[i])
}
var answer = -999999999
var i = 0
while i + k <= n {
    answer = max(answer, b[i + k] - b[i])
    i += 1
}
print(answer)