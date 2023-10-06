let n = Int(readLine()!)!
var count = 0
let numbers = [2, 0, 2, 3]
for i in 1...n {
    var temp = i
    var index = 3
    var success = false
    while temp > 0 {
        let r = temp % 10
        if r == numbers[index] {
            index -= 1
            if index == -1 {
                success = true 
                break
            }
        }
        temp /= 10
    }
    if success { count += 1 }
}
print(count)