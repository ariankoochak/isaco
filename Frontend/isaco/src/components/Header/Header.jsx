import React from "react";
import logoSrc from "../../assets/images/Logo.png";
import { useSelector } from "react-redux";
export default function Header() {
    const userData = useSelector((store) => store.userLogin.userLogin);
    const today = new Date().toLocaleDateString("fa-IR");
    return (
        <div className="header-main-div">
            <h3>سلام {userData.FirstName}</h3>
            <img src={logoSrc} alt="Logo" />
            <span>{today}</span>
        </div>
    );
}
