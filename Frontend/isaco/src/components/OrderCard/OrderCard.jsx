import React from 'react'

export default function OrderCard(propsData) {
  console.log(propsData);
  return (
    <div className='order-card-main-div'>
      <div className='image-container'>
        <img src={`../cars-images/${propsData.oderData.CarCategory}/${propsData.oderData.Color}.png`} alt="carImage" />
      </div>
      <div className='datas-container'>
        <h2>{propsData.oderData.CarName}</h2>
      </div>
    </div>
  )
}
