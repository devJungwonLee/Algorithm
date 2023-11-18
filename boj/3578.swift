let n = Int(readLine()!)!
if n == 0 { print("1") }
else if n == 1 { print("0") }
else {
    let s = String(repeating: "8", count: n / 2)
    n % 2 == 0 ? print(s) : print("4" + s)
}