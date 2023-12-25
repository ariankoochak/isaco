import React, { useEffect, useState } from 'react'
import OrderCard from '../OrderCard/OrderCard'
import { useSelector } from 'react-redux';

export default function LastOrdersList() {
    const [OrdersList,setOrdersList] = useState([])
    const reduxOrdersList = useSelector((store) => {
        return store.OrdersList.OrdersList
    });
    useEffect(() => {
        setOrdersList(reduxOrdersList);
    }, [reduxOrdersList]);
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
