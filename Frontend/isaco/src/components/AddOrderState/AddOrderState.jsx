import React, { useEffect, useRef, useState } from 'react'
import { useDispatch } from 'react-redux';
import { off } from '../../utils/store/slices/isAddOrderState';
import axios from 'axios';
import { updateOrderList } from '../../utils/store/slices/OrdersList';

export default function AddOrderState() {
    const carType = useRef();
    const carModel = useRef();
    const carColor = useRef();
    const lisencePlate = useRef();
    const ownerName = useRef();
    const ownerLastName = useRef();
    const ownerPhoneNumber = useRef();
    const autoServiceCheckBox = useRef();
    const autoServiceDetails = useRef();
    const engineAndGearboxCheckBox = useRef();
    const engineAndGearboxDetails = useRef();
    const frontingCheckBox = useRef();
    const frontingDetails = useRef();
    const detailingCheckBox = useRef();
    const detailingDetails = useRef();
    const othersCheckBox = useRef();
    const othersDetails = useRef();
    const dispatch = useDispatch();
    const handleCancelBtn = ()=>{
        dispatch(off())
    }
    const [carsType,setCarsType] = useState([])
    const [CarsModel, setCarsModel] = useState([{ CarName : '2008'}]);
    const [CarColors,setCarColors] = useState(["MetalicBlack",'MetalicGray','MetalicSilver','RoyalBlue','VenetianRed','White','White2Layer'])
    const makeCarsTypeJsx = ()=>{
        return carsType.map((carType)=>{
            return <option value={`${carType.CarCategory}`} key={`${carType.CarCategory}`}>{carType.CarCategory}</option>;
        })
    }
    const makeCarsModelJsx = ()=>{
        return CarsModel.map((carModel) => {
            return (
                <option
                    value={`${carModel.CarName}`}
                    key={`${carModel.CarName}`}
                >
                    {carModel.CarName}
                </option>
            );
        });
    }
    const makeCarsColorJsx = ()=>{
        return CarColors.map((color) => {
            return (
                <option value={`${color}`} key={`${color}`}>
                    {color}
                </option>
            );
        });
    }
    const updateCarModel = (carType)=>{
        axios
            .get(`http://localhost:3000/CarModel?${carType}`)
            .then(function (response) {
                setCarsModel(response.data);
            })
            .catch(function (error) {
                console.log(error);
            });
    }
    const updateCarColors = (carType)=>{
        axios
            .get(`http://localhost:3000/CarColors?${carType}`)
            .then(function (response) {
                setCarColors(response.data);
            })
            .catch(function (error) {
                console.log(error);
            });
    }
    useEffect(()=>{
        axios.get(`http://localhost:3000/CarsType`)
            .then(function (response) {
                setCarsType(response.data)
            })
            .catch(function (error) {
                console.log(error);
            });
    },[])
    const handleSubmitBtn = (e)=>{
        e.preventDefault();
        let servicesData = [];
        
        if(autoServiceCheckBox.current.checked){
            servicesData.push(`${autoServiceCheckBox.current.value}:${autoServiceDetails.current.value}`);
        }
        if(engineAndGearboxCheckBox.current.checked){
            servicesData.push(`${engineAndGearboxCheckBox.current.value}:${engineAndGearboxDetails.current.value}`);
        }
        if(frontingCheckBox.current.checked){
            servicesData.push(`${frontingCheckBox.current.value}:${frontingDetails.current.value}`);
        }
        if(detailingCheckBox.current.checked){
            servicesData.push(`${detailingCheckBox.current.value}:${detailingDetails.current.value}`);
        }
        if(othersCheckBox.current.checked){
            servicesData.push(`${othersCheckBox.current.value}:${othersDetails.current.value}`);
        }
        axios
            .post(`http://localhost:3000/AddOrder?${carType.current.value}?${carModel.current.value}?${carColor.current.value}?${lisencePlate.current.value}?${ownerName.current.value}?${ownerLastName.current.value}?${ownerPhoneNumber.current.value}?${servicesData.join(';')}`)
            .then(function (response) {
                console.log(response.status);
                axios
                .get(`http://localhost:3000/Orders`)
                .then(function (response) {
                    dispatch(updateOrderList(response.data[0]));
                })
                .catch(function (error) {
                    console.log(error);
                });
                handleCancelBtn();
            })
            .catch(function (error) {
                console.log(error);
            });
    }
  return (
      <>
          <div className="add-order-state-main-div"></div>
          <div className="add-order-state-main-div-upper">
              <div className="add-order-div">
                  <h2>پذیرش خودرو</h2>
                  <form action="">
                      <label for="carType">نوع خودرو : </label>
                      <select
                          ref={carType}
                          id="carType"
                          name="carType"
                          onChange={(e) => {
                              updateCarModel(e.target.value);
                              updateCarColors(e.target.value);
                          }}
                      >
                          {makeCarsTypeJsx()}
                      </select>
                      <br />
                      <label for="carName">مدل خودرو: </label>
                      <select id="carName" name="carName" ref={carModel}>
                          {makeCarsModelJsx()}
                      </select>
                      <br />
                      <label for="carColor">رنگ : </label>
                      <select id="carColor" name="carColor" ref={carColor}>
                          {makeCarsColorJsx()}
                      </select>
                      <br />
                      <label for="LisencePlate">شماره پلاک : </label>
                      <input
                            ref={lisencePlate}
                          type="text"
                          id="LisencePlate"
                          name="LisencePlate"
                      />
                      <br />
                      <label for="ownerName">نام مالک : </label>
                      <input ref={ownerName} type="text" id="ownerName" name="ownerName" />
                      <br />
                      <label  for="ownerLastName">نام خانوادگی مالک : </label>
                      <input
                            ref={ownerLastName}
                          type="text"
                          id="ownerLastName"
                          name="ownerLastName"
                      />
                      <br />
                      <label for="ownerPhoneNumber">شماره همراه مالک : </label>
                      <input
                      ref={ownerPhoneNumber}
                          type="text"
                          id="ownerPhoneNumber"
                          name="ownerPhoneNumber"
                      />
                      <br />
                      <h3>سرویس های مورد نیاز</h3>
                      <input
                      ref={autoServiceCheckBox}
                          type="checkbox"
                          id="AutoService"
                          name="AutoService"
                          value="AutoService"
                      />
                      <label for="AutoService">سرویس دوره ای</label>
                      <br />
                      <input
                        ref={autoServiceDetails}
                          type="text"
                          placeholder="توضیحات"
                          id="AutoService"
                          name="AutoService"
                          className="detail-input"
                      />
                      <br />
                      <input
                      ref={engineAndGearboxCheckBox}
                          type="checkbox"
                          id="EngineAndGearbox"
                          name="EngineAndGearbox"
                          value="EngineAndGearbox"
                      />
                      <label for="EngineAndGearbox">
                          تعمیرات موتور و گیربکس
                      </label>
                      <br />
                      <input
                      ref={engineAndGearboxDetails}
                          type="text"
                          placeholder="توضیحات"
                          id="EngineAndGearbox"
                          name="EngineAndGearbox"
                          className="detail-input"
                      />
                      <br />
                      <input
                      ref={frontingCheckBox}
                          type="checkbox"
                          id="Fronting"
                          name="Fronting"
                          value="Fronting"
                      />
                      <label for="Fronting">جلوبندی</label>
                      <br />
                      <input
                      ref={frontingDetails}
                          type="text"
                          placeholder="توضیحات"
                          id="Fronting"
                          name="Fronting"
                          className="detail-input"
                      />
                      <br />
                      <input
                      ref={detailingCheckBox}
                          type="checkbox"
                          id="Detailing"
                          name="Detailing"
                          value="Detailing"
                      />
                      <label for="Detailing">سرامیک و صافکاری بدنه</label>
                      <br />
                      <input
                      ref={detailingDetails}
                          type="text"
                          placeholder="توضیحات"
                          id="Detailing"
                          name="Detailing"
                          className="detail-input"
                      />
                      <br />
                      <input
                      ref={othersCheckBox}
                          type="checkbox"
                          id="Others"
                          name="Others"
                          value="Others"
                      />
                      <label for="Others">سایر خدمات مورد نیاز</label>
                      <br />
                      <input
                      ref={othersDetails}
                          type="text"
                          placeholder="توضیحات"
                          id="Others"
                          name="Others"
                          className="detail-input"
                      />
                      <br />
                      <button
                          type="submit"
                          className="submit-btn"
                          onClick={handleSubmitBtn}
                      >
                          ثبت پذیرش
                      </button>
                      <button className="cancel-btn" onClick={handleCancelBtn}>
                          لغو
                      </button>
                  </form>
              </div>
          </div>
      </>
  );
}
