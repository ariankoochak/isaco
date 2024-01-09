import React, { useRef } from 'react'
import { useDispatch } from 'react-redux';
import { off } from '../../utils/store/slices/isAddEmployeeState';
import axios from 'axios';
import { useNavigate } from "react-router-dom";


export default function AddNewEmployeeState() {
    const navigate = useNavigate()
    const dispatch = useDispatch()
    const serviceName = useRef();
    const employeeName = useRef();
    const employeeLastName = useRef();
    const employeePhoneNumber = useRef();
    const employeeUsername = useRef();
    const employeePassword = useRef();

    const handleCancelBtn = ()=>{
        dispatch(off())
    }
    const handleSubmitBtn = (e)=>{
        e.preventDefault()
        axios
            .post(
                `http://localhost:3000/AddEmployee?${serviceName.current.value}?${employeeName.current.value}?${employeeLastName.current.value}?${employeePhoneNumber.current.value}?${employeeUsername.current.value}?${employeePassword.current.value}`
            )
            .then(function (response) {
                console.log(response.status);
                axios
                    .get(`http://localhost:3000/Orders`)
                    .then(function (response) {
                        dispatch(off());
                        window.location.reload();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                handleCancelBtn();
            })
            .catch(function (error) {
                console.log(error);
            });
    }
  return (
      <>
          <div className="add-order-state-main-div"></div>
          <div className="add-new-employee-state-main-div-upper">
              <div className="add-employee-div">
                  <h2>اضافه کردن کارمند جدید</h2>
                  <form action="">
                      <label for="serviceName">نوع سرویس : </label>
                      <select
                          id="serviceName"
                          name="serviceName"
                          ref={serviceName}
                      >
                          <option value={"Others"}>سایر</option>
                          <option value={"Admin"}>ادمین</option>
                          <option value={"Detailing"}>سرامیک و صافکاری</option>
                          <option value={"Fronting"}>جلوبندی</option>
                          <option value={"EngineAndGearbox"}>
                              موتور و گیربکس
                          </option>
                          <option value={"autoService"}>اتوسرویس</option>
                      </select>
                      <br />
                      <label for="employeeName">نام : </label>
                      <input
                          ref={employeeName}
                          type="text"
                          id="employeeName"
                          name="employeeName"
                      />
                      <br />
                      <label for="employeeLastName">نام خانوادگی : </label>
                      <input
                          ref={employeeLastName}
                          type="text"
                          id="employeeLastName"
                          name="employeeLastName"
                      />
                      <br />
                      <label for="employeePhoneNumber">شماره همراه : </label>
                      <input
                          ref={employeePhoneNumber}
                          type="text"
                          id="employeePhoneNumber"
                          name="employeePhoneNumber"
                      />
                      <br />
                      <label for="s">نام کاربری : </label>
                      <input
                          ref={employeeUsername}
                          type="text"
                          id="employeeUsername"
                          name="employeeUsername"
                      />
                      <br />
                      <label for="employeePassword">رمز عبور : </label>
                      <input
                          ref={employeePassword}
                          type="text"
                          id="employeePassword"
                          name="employeePassword"
                      />
                      <br />
                      <button
                          type="submit"
                          className="submit-btn"
                          onClick={handleSubmitBtn}
                      >
                          ثبت
                      </button>
                      <button className="cancel-btn" onClick={handleCancelBtn}>
                          لغو
                      </button>
                  </form>
              </div>
          </div>
      </>
  ); 
}
