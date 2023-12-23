import React, { useEffect, useState } from 'react'
import OrderCard from '../OrderCard/OrderCard'
import axios from 'axios';

export default function LastOrdersList() {
    const [OrdersList,setOrdersList] = useState([])
    useEffect(()=>{
                axios
                    .get(`http://localhost:3000/Orders`)
                    .then(function (response) {
                        setOrdersList(response.data[0])
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
    },[])
    const MakeOrderCardJsx = ()=>{
        return OrdersList.map((order)=>{
            return <OrderCard key={order.id} oderData = {order}/>
        })
    }
  return (
    <>
    <div className='last-order-list-main-div'>
        {MakeOrderCardJsx()}
    </div>
    </>
  )
}
