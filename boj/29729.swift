let input = readLine()!.split(separator: " ").map { Int($0)! }
var size = input[0]
var count = 0
let m = input[1]
let n = input[2]
for _ in 0..<(m + n) {
    let x = Int(readLine()!)!
    if x == 1 { count += 1 }
    else { count -= 1 }
    if count > size { size *= 2 }
}
print(size)