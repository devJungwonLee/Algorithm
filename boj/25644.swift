let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var from = Int.max
var maxProfit = 0
for num in a {
    from = min(from, num)
    maxProfit = max(maxProfit, num-from)
}
print(maxProfit)
