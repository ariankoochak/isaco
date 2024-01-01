import React, { useState } from "react";
import LogoImage from "../../assets/images/Logo.png";
import axios from "axios";
import { useDispatch } from "react-redux";
import { logining } from "../../utils/store/slices/userLogin";
import { useNavigate } from "react-router-dom";
import codeToPlate from "../../services/utils/CodeToPlate";

export default function LoginPage() {
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const [userNameVal, setUserNameVal] = useState("");
    const [passwordVal, setPasswordVal] = useState("");
    const [isEnterWrongPass,setIsEnterWrongPass] = useState(false)
    const handleChangeUserNameVal = (e) => {
        setUserNameVal(e.target.value);
    };
    const handleChangePasswordVal = (e) => {
        setPasswordVal(e.target.value);
    };
    const handleClickSubmitButton = () => {
        axios.get(`http://localhost:3000/Login?${userNameVal}:${passwordVal}`)
            .then(function (response) {
                dispatch(logining(response.data))
                if (response.data.ServeiceName === 'Admin')
                    navigate(`/Employee/Admin`);
                else
                    navigate(`/Employee/Employees`);
            })
            .catch(function (error) {
                console.log(error);
                setIsEnterWrongPass(true)
            })
    };
    return (
        <>
            <div className="login-main-div">
                <div className="login-title-container">
                    <img src={LogoImage} alt="logo" />
                    <h2>ورود به سامانه ی ایساکو</h2>
                </div>
                <div className="text-boxs-container">
                    {isEnterWrongPass && <h4>نام کاربری یا رمز عبور صحیح نمی باشد</h4>}
                    <span>نام کاربری</span>
                    <input
                        type="text"
                        value={userNameVal}
                        onChange={handleChangeUserNameVal}
                    />
                    <span>رمز عبور</span>
                    <input
                        type="password"
                        value={passwordVal}
                        onChange={handleChangePasswordVal}
                    />
                </div>
                <button onClick={handleClickSubmitButton}>ورود</button>
            </div>
        </>
    );
}
