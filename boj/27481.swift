let n = Int(readLine()!)!
let input = readLine()!.map { String($0) }
var hotel = [Bool](repeating: false, count: 10)
for x in input {
    if x == "L" {
        let index = hotel.firstIndex { !$0 }!
        hotel[index] = true
    } else if x == "R" {
        let index = hotel.lastIndex { !$0 }!
        hotel[index] = true
    } else {
        let index = Int(x)!
        hotel[index] = false
    }
}
print(hotel.map { $0 ? "1" : "0" }.joined())