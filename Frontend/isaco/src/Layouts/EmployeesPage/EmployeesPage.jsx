import React from 'react'
import Header from '../../components/Header/Header';
import EmployeeOrderList from '../../components/EmployeeOrderList/EmployeeOrderList';

export default function EmployeesPage() {
  return (
      <div className="main-container">
          <Header />
          <EmployeeOrderList/>
      </div>
  );
}
