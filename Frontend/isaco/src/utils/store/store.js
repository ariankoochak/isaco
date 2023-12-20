import { configureStore } from "@reduxjs/toolkit";
import userLoginReducer from "./slices/userLogin";
export const store = configureStore({
    reducer: {
        userLogin : userLoginReducer,
    },
});
