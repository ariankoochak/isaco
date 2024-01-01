import axios from "axios";
import React, { useEffect, useState } from "react";
import serviceNameConvertor from "../../services/utils/ServiceNameConvertor";

export default function EmployeeList() {
    const [employeeList,setEmployeeList] = useState([]);
    useEffect(() => {
        axios
            .get(`http://localhost:3000/Employees`)
            .then(function (response) {
                setEmployeeList((state) => state = response.data[0]);
            })
            .catch(function (error) {
                console.log(error);
            });
    },[]);
    const makeEmployeeListJsx = ()=>{
        return employeeList.map((employee)=>{
            return (
                <div className="employee-container">
                    <span>
                        {employee.FirstName}&nbsp;&nbsp;
                        {employee.LastName}
                    </span>
                    <span className="service-name">{serviceNameConvertor(employee.ServeiceName)}</span>
                </div>
            );
        })
    }
    return (
        <div className="employee-list-main-div">
            <h4>لیست کارمندان </h4>
            <div className="line"></div>
            {makeEmployeeListJsx()}
        </div>
    );
}
