import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useSelector } from 'react-redux';
import EmployeeOrderCard from '../EmployeeOrderCard/EmployeeOrderCard';

export default function EmployeeOrderList() {
    const userData = useSelector((store) => store.userLogin.userLogin);
    const [OrdersList, setOrdersList] = useState([]);
    const MakeOrderCardJsx = () => {
        return OrdersList.map((order) => {
            return <EmployeeOrderCard key={order.id} oderData={order} />;
        });
    };
    useEffect(() => {
        axios
            .get(
                `http://localhost:3000/getServiceOrder?${userData.ServeiceName}`
            )
            .then(function (response) {
                setOrdersList(response.data);
            })
            .catch(function (error) {
                console.log(error);
            });
    }, [userData]);
  return (
    <div className='employee-orders-list-main-div'>
        {MakeOrderCardJsx()}
    </div>
  )
}
