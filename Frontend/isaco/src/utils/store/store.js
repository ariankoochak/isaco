import { configureStore } from "@reduxjs/toolkit";
import userLoginReducer from "./slices/userLogin";
import isAddOrderStateReducer from "./slices/isAddOrderState";
import isAddEmployeeStateReducer from "./slices/isAddEmployeeState";
import OrdersList from "./slices/OrdersList";
export const store = configureStore({
    reducer: {
        userLogin: userLoginReducer,
        isAddOrderState: isAddOrderStateReducer,
        isAddEmployeeState: isAddEmployeeStateReducer,
        OrdersList: OrdersList,
    },
});
