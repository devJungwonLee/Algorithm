const rl = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout
});

let i = 0, input = [];
let n, a, d = [], answer = 0;

rl.on("line", (line) => {
    input.push(line);
    i++;
    if (i==2) rl.close(); 
}).on("close", () => {
    main();
    process.exit();
});

function main() {
    n = Number(input[0]);
    a = input[1].split(' ').map(x => Number(x));
    for(let i=0; i<n; i++) d.push(0);
    for(let i=0; i<n; i++) {
        if (i==0) d[i] = 1;
        else if (a[i] > d[i-1]) d[i] = d[i-1] + 1;
        else d[i] = a[i];
        answer = Math.max(answer, d[i]);
    }
    console.log(answer);
}