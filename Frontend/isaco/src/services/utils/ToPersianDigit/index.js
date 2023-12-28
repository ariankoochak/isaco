const toPersianDigit = (number) => {
    const farsiDigits = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];

    return number
        .toString()
        .split("")
        .map((x) => farsiDigits[x])
        .join("");
};
export default toPersianDigit;
