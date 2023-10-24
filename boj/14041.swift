import Foundation
let input = readLine()!.components(separatedBy: ":").map { Int($0)! }
let departure = input[0] * 60 + input[1]
let start = departure < 12 * 60 ? 7 * 60 : 15 * 60
let end = departure < 12 * 60 ? 10 * 60 : 19 * 60
var d = 240
var current = departure
while d > 0 {
    if (start..<end) ~= current { d -= 1 }
    else { d -= 2 }
    current += 1
}
if current >= 24 * 60 { current -= 24 * 60 }
print(String(format: "%02d:%02d", current / 60, current % 60))