let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let m = input[1]
var i = 1
while true {
    if a * i % m == 1 {
        print(i)
        break
    }
    i += 1
}