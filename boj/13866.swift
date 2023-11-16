let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
print(abs(a[0] + a[3] - a[1] - a[2]))