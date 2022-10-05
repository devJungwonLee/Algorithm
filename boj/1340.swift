import Foundation
let months = ["January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6, "July": 7, "August": 8, "September": 9, "October": 10, "November": 11, "December": 12]
let days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
func isLeapYear(_ year: Int) -> Bool {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

let s = readLine()!.components(separatedBy: " ")
let month = months[s[0]]!
let day = Int(s[1].trimmingCharacters(in: [","]))!
let year = Int(s[2])!
let time = s[3].components(separatedBy: ":")
var seconds = Int(time[0])!*3600 + Int(time[1])!*60
let total = isLeapYear(year) ? 366*86400 : 365*86400
seconds += (day-1) * 86400
seconds += (1..<month).map { days[$0] }.reduce(0, +) * 86400
if isLeapYear(year) && month > 2 { seconds += 86400 }
print(Double(seconds) / Double(total) * 100)

