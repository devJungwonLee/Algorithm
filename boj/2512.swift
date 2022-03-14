import Foundation

let n = Int(readLine()!)!
let requests = readLine()!.components(separatedBy: " ").map { Int($0)! }
let m = Int(readLine()!)!
var left = 1
var right = requests.max()!
while left < right {
    let mid = (left + right) / 2 + 1
    var sum = 0
    for request in requests {
        sum += min(request, mid)
    }
    if sum > m { right = mid - 1 }
    else { left = mid }
}
print(left)