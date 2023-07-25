const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const numberOfLines = 2;
let i = 0;
let input = [];
let a, n, k, d = [];
let energy = {};

rl.on("line",(line) => {
    input.push(line);
    i += 1;
    if (i===2) rl.close();
}).on("close", () => {
    main();
    process.exit();
});

function findEnergy(from) {
    let sum = 0;
    for (let i=from; i<n; i++) {
        sum += a[i];
        if (sum >= k) {
            energy[from] = [i, sum-k];
            return;
        }
    }
}

function main() {
    [n, k] = input[0].split(' ').map(x => Number(x));
    a = input[1].split(' ').map(x => Number(x));
    for (let i=0; i<n; i++) {
        d.push(0);
        findEnergy(i);
    }
    for (let i=0; i<n; i++) {
        if (i > 0) d[i] = Math.max(d[i], d[i-1]);
        if (energy[i] != undefined) {
            const [j, e] = energy[i];
            const before = i > 0 ? d[i-1] : 0;
            d[j] = Math.max(d[j], before + e);
        }
    }
    console.log(d[n-1]);
}