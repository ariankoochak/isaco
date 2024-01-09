import React, { useRef } from 'react'
import { useDispatch } from 'react-redux';
import { off } from '../../utils/store/slices/isAddEmployeeState';

export default function AddNewEmployeeState() {
    const dispatch = useDispatch()
    const serviceName = useRef();
    const employeeName = useRef();
    const employeeLastName = useRef();
    const employeePhoneNumber = useRef();
    const handleCancelBtn = ()=>{
        dispatch(off())
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
                          <option value={"EngineAndGearbox"}>موتور و گیربکس</option>
                          <option value={"autoService"}>اتوسرویس</option>
                      </select>
                      <br />
                      <label for="ownerName">نام : </label>
                      <input
                          ref={employeeName}
                          type="text"
                          id="ownerName"
                          name="ownerName"
                      />
                      <br />
                      <label for="ownerLastName">نام خانوادگی : </label>
                      <input
                          ref={employeeLastName}
                          type="text"
                          id="ownerLastName"
                          name="ownerLastName"
                      />
                      <br />
                      <label for="ownerPhoneNumber">شماره همراه : </label>
                      <input
                          ref={employeePhoneNumber}
                          type="text"
                          id="ownerPhoneNumber"
                          name="ownerPhoneNumber"
                      />
                      <br />
                      <button type="submit" className="submit-btn" onClick={""}>
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
