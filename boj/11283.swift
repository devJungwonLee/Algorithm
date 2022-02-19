extension String {
    var unicode: UInt32 { self.unicodeScalars.first!.value }
}
print(readLine()!.unicode - "가".unicode + 1)