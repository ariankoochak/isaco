const serviceNameConvertor = (serviceName) => {
    let exp = '';
    switch (serviceName) {
        case "autoService":
        case "AutoService":
            exp = "اتو سرویس";
            break;
        case "EngineAndGearbox":
            exp = "موتور و گیربکس";
            break;
        case "Detailing":
            exp = "سرامیک و صافکاری";
            break;
        case "Fronting":
            exp = "جلوبندی";
            break;
        case "Others":
            exp = "سایر";
            break;
        case "Admin":
            exp = "ادمین";
            break;
        default:
            exp = "bug in serviceNameConvertor service";
    }
    return exp
};
export default serviceNameConvertor;
