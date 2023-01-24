const fs = require('fs');
let input = fs.readFileSync('/dev/stdin').toString().split('\n');
let a = input[1].split(' ').map(Number).sort((a, b) => a - b);
let sum = a[0];
for (i=1; i<=a.length-1; i++) {
    if (a[i] == a[i-1] + 1) continue;
    sum += a[i];
}
console.log(sum);