let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
if a[2] == a[0] + a[1] { print("1") }
else if a[2] == a[0] * a[1] { print("2") }
else { print("3") }
