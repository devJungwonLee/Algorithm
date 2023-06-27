var k = Int(readLine()!)!
if k % 100 > 0 { k = (k / 100 + 1) * 100 }
var sum = 0
sum += k / 500
k = k % 500
sum += k / 200
k = k % 200
sum += k / 100
print(sum)