let weight = Double(readLine()!)!
let height = Double(readLine()!)!
let bmi = weight / height / height
if bmi > 25 {
    print("Overweight")
} else if bmi >= 18.5 {
    print("Normal weight")
} else {
    print("Underweight")
}