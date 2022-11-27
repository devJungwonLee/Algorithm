let s = readLine()!.split(separator: " ").map { Int($0)! }
print(s[1] / s[0] * 3 * s[2])
