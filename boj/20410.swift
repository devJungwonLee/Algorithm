let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let seed = input[1]
let x1 = input[2]
let x2 = input[3]
var a = -1
var c = -1
for i in 0..<m {
    for j in 0..<m {
        if (i * seed + j) % m == x1, (i * x1 + j) % m == x2 {
            a = i
            c = j
            break
        }
    }
    if a >= 0 { break }
}
print(a, c)