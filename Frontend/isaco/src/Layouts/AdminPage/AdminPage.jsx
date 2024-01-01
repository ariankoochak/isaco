import React, { useEffect } from 'react'
import Header from '../../components/Header/Header'
import AddNewOrder from "../../components/AddNewOrder/AddNewOrder";
import AddOrderState from "../../components/AddOrderState/AddOrderState";
import { useDispatch, useSelector } from 'react-redux';
import LastOrdersList from '../../components/LastOrdersList/LastOrdersList';
import axios from 'axios';
import { updateOrderList } from '../../utils/store/slices/OrdersList';
import AdminLastDoneOrder from "../../components/AdminLastDoneOrder/AdminLastDoneOrder";
import UpcoBtn from '../../components/UpcoBtn/UpcoBtn';
import EmployeeList from '../../components/EmployeeList/EmployeeList';
import AddNewEmployee from '../../components/AddNewEmployee/AddNewEmployee';
export default function AdminPage() {
    const dispatch = useDispatch();
  const isAddOrderState = useSelector((state)=>state.isAddOrderState.isAddOrderState)
  useEffect(()=>{
    axios
        .get(`http://localhost:3000/Orders`)
        .then(function (response) {
            console.log(response.data[0]);
            dispatch(updateOrderList(response.data[0]));
        })
        .catch(function (error) {
            console.log(error);
        });
  })
  return (
      <>
          {isAddOrderState && <AddOrderState />}
          <div className="main-container">
              <Header />
              <AddNewOrder />
              <LastOrdersList />
              <EmployeeList />
              <AddNewEmployee />

              <UpcoBtn />
              <AdminLastDoneOrder />
          </div>
      </>
  );
}
