import React from "react";
import logoSrc from "../../assets/images/Logo.png";
import { useDispatch, useSelector } from "react-redux";
import { logouting } from "../../utils/store/slices/userLogin";
import { useNavigate } from "react-router-dom";
export default function Header() {
    const userData = useSelector((store) => store.userLogin.userLogin);
    const today = new Date().toLocaleDateString("fa-IR");
    const dispatch = useDispatch()
    const navigate = useNavigate();
    const handleLogOutClickBtn = ()=>{
        dispatch(logouting())
        navigate("/Login");
    }
    return (
        <div className="header-main-div">
            <h3>سلام {userData.FirstName}</h3>
            <img src={logoSrc} alt="Logo" />
            <span>{today}</span>
            <button className="log-out-btn" onClick={handleLogOutClickBtn}>خروج</button>
        </div>
    );
}
