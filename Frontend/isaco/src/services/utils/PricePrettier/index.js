const pricePrettier = (price) => {
    price = String(price).split("");
    let counter = 1;
    for (let i = price.length - 1; i >= 0; i--) {
        if (counter === 3 && i !== 0) {
            price.splice(i, 0, ",");
            counter = 1;
        } else counter++;
    }
    return price.join("");
};
export default pricePrettier;
