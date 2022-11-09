let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
if m <= 2 { print("NEWBIE!") }
else if m <= n { print("OLDBIE!") }
else { print("TLE!") }
