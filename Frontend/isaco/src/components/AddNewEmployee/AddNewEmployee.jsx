import React from 'react'
import { useDispatch } from 'react-redux';
import { on } from '../../utils/store/slices/isAddEmployeeState';
export default function AddNewEmployee() {
    const dispatch = useDispatch()
    const handleClickAddEmployee = ()=>{
        dispatch(on());
        
    }
    return (
        <div className="add-new-employee-main-div" onClick={handleClickAddEmployee}>
            <h4>اضافه کردن کارمند جدید</h4>
        </div>
    );
}
