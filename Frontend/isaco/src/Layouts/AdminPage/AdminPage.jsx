import React from 'react'
import Header from '../../components/Header/Header'
import AddNewOrder from "../../components/AddNewOrder/AddNewOrder";
import AddOrderState from "../../components/AddOrderState/AddOrderState";
import { useSelector } from 'react-redux';
import LastOrdersList from '../../components/LastOrdersList/LastOrdersList';
export default function AdminPage() {
  const isAddOrderState = useSelector((state)=>state.isAddOrderState.isAddOrderState)
  return (
      <>
          {isAddOrderState && <AddOrderState />}
          <Header />
          <AddNewOrder />
          <LastOrdersList/>
      </>
  );
}
