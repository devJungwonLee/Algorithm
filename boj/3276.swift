import Foundation
let n = Int(readLine()!)!
let a = Int(ceil(sqrt(Double(n))))
let b = n / a + (n % a == 0 ? 0 : 1)
print(a, b)
