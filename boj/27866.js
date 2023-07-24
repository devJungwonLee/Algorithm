const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const numberOfLines = 2;
let i = 0;
let input = [];

rl.on("line", (line) => {
    input.push(line);
    i++;
    if (i===numberOfLines) rl.close();
}).on("close", () => {
    main();
    process.exit();
});

function main() {
    const s = input[0];
    const i = Number(input[1]);
    console.log(s[i-1]);
}