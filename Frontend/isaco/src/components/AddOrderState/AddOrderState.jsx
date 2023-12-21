import React, { useEffect, useState } from 'react'
import { useDispatch } from 'react-redux';
import { off } from '../../utils/store/slices/isAddOrderState';
import axios from 'axios';

export default function AddOrderState() {
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
  return (
      <>
          <div className="add-order-state-main-div"></div>
          <div className="add-order-state-main-div-upper">
              <div className="add-order-div">
                  <h2>پذیرش خودرو</h2>
                  <form action="/action_page.php">
                      <label for="carType">نوع خودرو : </label>
                      <select
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
                      <select id="carName" name="carName">
                          {makeCarsModelJsx()}
                      </select>
                      <br />
                      <label for="carColor">رنگ : </label>
                      <select id="carColor" name="carColor">
                          {makeCarsColorJsx()}
                      </select>
                      <br />
                      <label for="LisencePlate">شماره پلاک : </label>
                      <input
                          type="text"
                          id="LisencePlate"
                          name="LisencePlate"
                      />
                      <br />
                      <label for="ownerName">نام مالک : </label>
                      <input type="text" id="ownerName" name="ownerName" />
                      <br />
                      <label for="ownerLastName">نام خانوادگی مالک : </label>
                      <input
                          type="text"
                          id="ownerLastName"
                          name="ownerLastName"
                      />
                      <br />
                      <label for="ownerPhoneNumber">شماره همراه مالک : </label>
                      <input
                          type="text"
                          id="ownerPhoneNumber"
                          name="ownerPhoneNumber"
                      />
                      <br />
                      <h3>سرویس های مورد نیاز</h3>
                      <input
                          type="checkbox"
                          id="AutoService"
                          name="AutoService"
                          value="AutoService"
                      />
                      <label for="AutoService">سرویس دوره ای</label>
                      <br />
                      <input
                          type="text"
                          placeholder="توضیحات"
                          id="AutoService"
                          name="AutoService"
                          className="detail-input"
                      />
                      <br />
                      <input
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
                          type="text"
                          placeholder="توضیحات"
                          id="EngineAndGearbox"
                          name="EngineAndGearbox"
                          className="detail-input"
                      />
                      <br />
                      <input
                          type="checkbox"
                          id="Fronting"
                          name="Fronting"
                          value="Fronting"
                      />
                      <label for="Fronting">جلوبندی</label>
                      <br />
                      <input
                          type="text"
                          placeholder="توضیحات"
                          id="Fronting"
                          name="Fronting"
                          className="detail-input"
                      />
                      <br />
                      <input
                          type="checkbox"
                          id="Detailing"
                          name="Detailing"
                          value="Detailing"
                      />
                      <label for="Detailing">سرامیک و صافکاری بدنه</label>
                      <br />
                      <input
                          type="text"
                          placeholder="توضیحات"
                          id="Detailing"
                          name="Detailing"
                          className="detail-input"
                      />
                      <br />
                      <input
                          type="checkbox"
                          id="Others"
                          name="Others"
                          value="Others"
                      />
                      <label for="Others">سایر خدمات مورد نیاز</label>
                      <br />
                      <input
                          type="text"
                          placeholder="توضیحات"
                          id="Others"
                          name="Others"
                          className="detail-input"
                      />
                      <br />
                      <button type="submit" className="submit-btn">
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
