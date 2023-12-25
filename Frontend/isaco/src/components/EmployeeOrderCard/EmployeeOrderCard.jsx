import React from 'react'
import { useSelector } from 'react-redux';

export default function EmployeeOrderCard(propsData) {
    const userData = useSelector((store) => store.userLogin.userLogin);
    console.log(propsData);
    const serviceDecoder = (services) => {
        services = services.split(";");
        for (let i = 0; i < services.length; i++) {
            services[i] = services[i].split(":");
            if (services[i][0] === userData.ServeiceName){
                return services[i][1]
            }
        }
        return;
    };
    return (
        <div className="employee-order-card-main-div">
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
                    <span className="date">
                        {" "}
                        {propsData.oderData.StartTime}
                    </span>
                </div>
            </div>
        </div>
    );
}
