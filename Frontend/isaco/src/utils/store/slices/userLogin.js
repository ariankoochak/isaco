import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    userLogin: {},
};

export const userLoginSlice = createSlice({
    name: "userLogin",
    initialState,
    reducers: {
        logining: (state, action) => {
            state.userLogin = { ...action.payload };
        },
        logouting: (state) => {
            state.userLogin = {};
        },
    },
});

// Action creators are generated for each case reducer function
export const { logining , logouting} = userLoginSlice.actions;

export default userLoginSlice.reducer;
