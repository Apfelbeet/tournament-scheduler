export function randomKey(length: number) {
    let x = "";
    for (let i = length; i > 0; i -= 11) {
        x += Math.random()
            .toString(36)
            .substring(2, length + 2);
    }
    return x;
}

export function getRandomInt(max: number) {
    return Math.floor(Math.random() * Math.floor(max + 1));
}


