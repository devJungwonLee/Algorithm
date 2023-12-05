var a = readLine()!.split(separator: " ").map { Int($0)! }
a.sort()
if a[0] == a[1] && a[1] == a[2] {
    print("2")
} else if a[2] * a[2] == a[0] * a[0] + a[1] * a[1] {
    print("1")
} else {
    print("0")
}