let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]
let c = input[2]
let m = input[3]
var time = 0
var fatigue = 0
var work = 0
while time < 24 {
    if fatigue + a <= m {
        fatigue += a
        work += b
    } else {
        fatigue = max(0, fatigue - c)
    }
    time += 1
}
print(work)