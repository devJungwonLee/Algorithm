let n = Int(readLine()!)!
var d = [Int](repeating: 0, count: n + 1)
let coins = [7, 5, 2, 1]
if n >= 1 {
    for i in 1...n {
        var minValue = Int.max
        for coin in coins {
            if i < coin { continue }
            else if i == coin { 
                minValue = 1
                break
            } else if d[i - coin] + 1 < minValue {
                minValue = d[i - coin] + 1
            }
        }
        d[i] = minValue
    }
}
print(d[n])