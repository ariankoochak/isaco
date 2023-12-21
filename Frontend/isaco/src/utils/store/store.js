import { configureStore } from "@reduxjs/toolkit";
import userLoginReducer from "./slices/userLogin";
import isAddOrderStateReducer from "./slices/isAddOrderState"
export const store = configureStore({
    reducer: {
        userLogin : userLoginReducer,
        isAddOrderState : isAddOrderStateReducer,
    },
});
