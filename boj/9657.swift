let n = Int(readLine()!)!
var d = [Bool](repeating: false, count: n + 1)
let once = [1, 3, 4]
for i in 1...n {
    if once.contains(i) {
        d[i] = true
    } else {
        for num in once {
            if i <= num { break }
            if !d[i - num] { d[i] = true }
        }
    }
}
d[n] ? print("SK") : print("CY")