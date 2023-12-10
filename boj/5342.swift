import Foundation
let cost: [String: Double] = [
    "Paper": 57.99, "Printer": 120.50, "Planners": 31.25,
    "Binders": 22.50, "Calendar": 10.95, "Notebooks": 11.20,
    "Ink": 66.95
]
var sum = 0.0
while let item = readLine() {
    guard let c = cost[item] else { continue }
    sum += c
}
if sum > 0 { print(String(format: "$%.2f", sum)) }