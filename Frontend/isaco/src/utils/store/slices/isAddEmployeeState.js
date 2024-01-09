import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    isAddEmployeeState: false,
};

export const isAddEmployeeStateSlice = createSlice({
    name: "isAddEmployeerState",
    initialState,
    reducers: {
        on: (state) => {
            state.isAddEmployeeState = true;
        },
        off: (state) => {
            state.isAddEmployeeState = false;
        },
    },
});

// Action creators are generated for each case reducer function
export const { on, off } = isAddEmployeeStateSlice.actions;

export default isAddEmployeeStateSlice.reducer;
