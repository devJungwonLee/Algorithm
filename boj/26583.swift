while let s = readLine() {
    let a = s.split(separator: " ").map { Int($0)! }
    let b = (0..<a.count).map { (index: Int) -> Int in
        var product = a[index]
        if (0..<a.count) ~= (index - 1) { product *= a[index - 1] }
        if (0..<a.count) ~= (index + 1) { product *= a[index + 1] }
        return product
    }
    print(b.map { String($0) }.joined(separator: " "))
}