let s = readLine()!.split(separator: " ").map { Int($0)! }
let k = s[0]
let n = s[1]
var a = [Int]()
for _ in 0..<k {
    a.append(Int(readLine()!)!)
}
var left  = 1
var right = Int(Int32.max)

while left < right {
    let mid = (left + right + 1) / 2
    var sum = 0
    for x in a { 
        sum += x / mid 
        if sum >= n { break }
    }
    if sum >= n { left = mid }
    else { right = mid - 1 }
}
print(left)
