import Foundation
let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let m = s[0]
let n = s[1]
var cnt = 0
var row = 0
var col = 0

if m > n {
    cnt = 2 * n - 1
    if n % 2 == 1 { row = m - (n+1)/2 }
    else { row = (n+1)/2 }
    col = (n-1)/2
} else {
    cnt = 2 * m - 2
    if m % 2 == 1 { col = n - m/2 - 1 }
    else { col = m/2 - 1 }
    row = m/2
}
print(cnt)
print(row+1, col+1)