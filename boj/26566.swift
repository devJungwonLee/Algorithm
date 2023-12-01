let t = Int(readLine()!)!
for _ in 0..<t {
    var input = readLine()!.split(separator: " ").map { Double($0)! }
    let x = input[1] / input[0]
    input = readLine()!.split(separator: " ").map { Double($0)! }
    let y = input[1] / input[0] / input[0] / 3.1415926535
    x < y ? print("Slice of pizza") : print("Whole pizza")
}