import React from 'react'
import serviceNameConvertor from '../../services/utils/ServiceNameConvertor';
import Plate from '../Plate/Plate';

export default function OrderCard(propsData) {
  console.log(propsData);
  const serviceDecoder = (services) => {
    services = services.split(';')
    for (let i = 0;i < services.length;i++) {
      services[i] = services[i].split(":");
      services[i][0] = serviceNameConvertor(services[i][0])
      services[i] = services[i].join(' : ')
    }
    return services.join(' / ')
  };
  const isEnd = (endTime)=>{
    if(endTime == null)
        return false
    else
        return true
  }
  return (
      <div className="order-card-main-div">
          <div className="image-container">
              <img
                  src={`../cars-images/${propsData.oderData.CarCategory}/${propsData.oderData.Color}.png`}
                  alt="carImage"
              />
          </div>
          <div className="datas-container">
              <div className="title">
                  <h2>{propsData.oderData.CarName}</h2>
              </div>
              <div className="describe">
                  <p>{serviceDecoder(propsData.oderData.ServicesListIds)}</p>
              </div>
              <div className="start-time">
                  <span className="date-label">تاریخ پذیرش :</span>
                  <span className="date"> {propsData.oderData.StartTime}</span>
              </div>
              <div className="order-status">
                  <span
                      className={
                          isEnd(propsData.oderData.EndTime) ? "end" : "working"
                      }
                  >
                      {isEnd(propsData.oderData.EndTime)
                          ? "اتمام کار"
                          : "در حال انجام"}
                  </span>
              <Plate plateCode={propsData.oderData.LicensePlate} />
              </div>
          </div>
      </div>
  );
}
