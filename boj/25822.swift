let c = Double(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
let m = min(2, Int(c / 0.99))
var d = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n)
if a[0] == 0, m > 0 { d[0][1] = 1 }
else { d[0][0] = 1 }
var maxValue = a[0]
var maxDay = d[0].max()!
for i in 1..<n {
    for j in 0...m {
        if a[i] > 0 {
            if d[i-1][j] > 0 { 
                d[i][j] = d[i-1][j] + 1
            } else if j == 0 {
                d[i][j] = 1
            }
        } else {
            if j - 1 >= 0, d[i-1][j-1] > 0 {
                d[i][j] = d[i-1][j-1] + 1 
            } else if j == 1 {
                d[i][j] = 1
            }
        }
    }
    maxDay = max(maxDay, d[i].max()!)
    maxValue = max(maxValue, a[i])
}
print(maxDay)
print(maxValue)