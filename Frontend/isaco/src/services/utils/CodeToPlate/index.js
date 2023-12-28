import toPersianDigit from "../ToPersianDigit";

const codeToPlate = (code) => {
    let template = [toPersianDigit(Number(code.substring(0,2)))];
    let alphabet = code.substring(2,4);
    switch (alphabet) {
        case "BE":
            alphabet = 'ب';
            break;
        case "JE":
            alphabet = "ج";
            break;
        case "DE":
            alphabet = "د";
            break;
        case "SN":
            alphabet = "س";
            break;
        case "SD":
            alphabet = "ص";
            break;
        case "TA":
            alphabet = "ط";
            break;
        case "GH":
            alphabet = "ق";
            break;
        case "LM":
            alphabet = "ل";
            break;
        case "MM":
            alphabet = "م";
            break;
        case "NN":
            alphabet = "ن";
            break;
        case "VV":
            alphabet = "و";
            break;
        case "HH":
            alphabet = "هـ";
            break;
        case "YE":
            alphabet = "ی";
            break;
        case "AF":
            alphabet = "الف";
            break;
        case "PE":
            alphabet = "پ";
            break;
        case "TE":
            alphabet = "ت";
            break;
        case "SE":
            alphabet = "ث";
            break;
        case "ZE":
            alphabet = "ز";
            break;
        case "ZH":
            alphabet = "ژ";
            break;
        case "SH":
            alphabet = "ش";
            break;
        case "EN":
            alphabet = "ع";
            break;
        case "FE":
            alphabet = "ف";
            break;
        case "KF":
            alphabet = "ک";
            break;
        case "GF":
            alphabet = "گ";
            break;
        case "DD":
            alphabet = "D";
            break;
        case "SS":
            alphabet = "S";
            break;
        default:
            console.error("error in code to plate");
    }
    template.push(alphabet)
    template.push(toPersianDigit(Number(code.substring(4,7))));
    template.push(toPersianDigit(Number(code.substring(7))));
    return template
};
export default codeToPlate;
