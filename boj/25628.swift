let s = readLine()!.split(separator: " ").map { Int($0)! }
print(min(s[0]/2, s[1]))
