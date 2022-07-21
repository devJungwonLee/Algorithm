import Foundation

let N = Int(readLine()!)!
var x = 0
var y = 1
var z = 0
let mod = 1000000000
if N == 1 { z = x }
else if N == 2 { z = y }
else {
    for i in 3...N {
        z = (i-1) * ((x + y) % mod) % mod
        x = y
        y = z
    }
}
print(z)