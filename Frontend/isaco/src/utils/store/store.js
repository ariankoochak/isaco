import { configureStore } from "@reduxjs/toolkit";
import userLoginReducer from "./slices/userLogin";
import isAddOrderStateReducer from "./slices/isAddOrderState";
import OrdersList from "./slices/OrdersList";
export const store = configureStore({
    reducer: {
        userLogin: userLoginReducer,
        isAddOrderState: isAddOrderStateReducer,
        OrdersList: OrdersList,
    },
});
