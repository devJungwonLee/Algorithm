let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var a = [Int]()
var price = 1000000
var maxProfit = 0
for _ in 0..<m {
    let num = Int(readLine()!)!
    a.append(num)
}
a.sort { $0 > $1 }
for i in a.indices {
    let profit = min(i+1, n) * a[i]
    if profit > maxProfit {
        price = a[i]
        maxProfit = profit
    }
}
print(price, maxProfit)
