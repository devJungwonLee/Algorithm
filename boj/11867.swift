let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = min(input[0], input[1])
let m = max(input[0], input[1])
var d = [Int: Bool]()

func canWin(_ x: Int) -> Bool {
    if let result = d[x] {
        return result
    } else if x == 1 {
        d[x] = false
        return d[x]!
    } else if x == 2 {
        d[x] = true
        return d[x]!
    } else {
        var i = 1 
        while i <= x - i {
            let result1 = canWin(i)
            let result2 = canWin(x - i)
            if !result1 && !result2 {
                d[x] = true
                return d[x]!
            }
            i += 1
        }
        d[x] = false
        return d[x]!
    }
}

if canWin(n) || canWin(m) { print("A") }
else { print("B") }