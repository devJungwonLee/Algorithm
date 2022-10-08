var d = [Int:[[Int]]]()
var mod = 1000000000

func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
    var result = [[0, 0], [0, 0]]
    result[0][0] = (a[0][0] * b[0][0] % mod + a[0][1] * b[1][0] % mod) % mod
    result[0][1] = (a[0][0] * b[0][1] % mod + a[0][1] * b[1][1] % mod) % mod
    result[1][0] = (a[1][0] * b[0][0] % mod + a[1][1] * b[1][0] % mod) % mod
    result[1][1] = (a[1][0] * b[0][1] % mod + a[1][1] * b[1][1] % mod) % mod
    return result
}

func f(_ n: Int) -> [[Int]] {
    if n == 1 { return [[1, 1], [1, 0]] }
    if let a = d[n] {
        return a
    } else {
        if n % 2 == 0 {
            let a = f(n/2)
            d[n] = multiply(a, a)
        } else {
            let a = f(n-1)
            d[n] = multiply(a, f(1))
        }
        return d[n]!
    }
}

var n = Int(readLine()!)!
var sign = 1

if n < 0 {
    n *= -1
    if n % 2 == 0 { sign = -1 }
}
var answer = 0
if n == 1 { answer = 1 }
else if n > 1 {
    let a = f(n-1)
    answer = a[0][0]
}
n == 0 ? print("0") : print(sign)
print(answer)
