import Foundation

let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var a = [[Int]](repeating: [Int](repeating: 0, count: m), count: 26)

for i in 0..<26 { a[i][0] = 1 }
for j in 1..<m {
   
    for i in 0..<26 {
        var sum = 0
        var x = i - n
        while 0..<26 ~= x {
            sum = (sum + a[x][j-1]) % 1000000007
            x -= 1
        }
        x = n == 0 ? i + n + 1 : i + n
        while 0..<26 ~= x { 
            sum = (sum + a[x][j-1]) % 1000000007
            x += 1
        } 
        a[i][j] = sum
    }
}

var ans = 0
for i in 0..<26 { ans = (ans + a[i][m-1]) % 1000000007 }
print(ans)