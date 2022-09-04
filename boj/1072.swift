import Foundation

let s = readLine()!.split(separator: " ").map { Int($0)! }
let x = s[0]
let y = s[1]
let p = NSDecimalNumber(decimal: Decimal(y) / Decimal(x) * 100).intValue
if p >= 99 {
    print("-1")
} else { 
    var left = 1
    var right = Int.max - x
    while left < right {
        let mid = (left + right) / 2
        let newp = NSDecimalNumber(decimal: Decimal(y + mid) / Decimal(x + mid) * 100).intValue
        if p == newp { left = mid + 1 }
        else { right = mid }
    }
    print(left)
}