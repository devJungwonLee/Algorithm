let s = readLine()!.split(separator: " ").map { Int($0)! }
for x in (-999...999) {
    for y in (-999...999) {
        if s[0]*x + s[1]*y == s[2] && s[3]*x + s[4]*y == s[5] {
            print(x, y)
            break
        }
    }
}
