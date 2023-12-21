import React from 'react'
import { useDispatch } from 'react-redux';
import { on } from '../../utils/store/slices/isAddOrderState';

export default function AddNewOrder() {
    const dispatch = useDispatch();
    const handleClickAddNewOrder = ()=>{
        dispatch(on());
    }
  return (
    <>
        <button className='add-new-order-btn' onClick={handleClickAddNewOrder}>پذیرش خودروی جدید</button>
    </>
  );
}
