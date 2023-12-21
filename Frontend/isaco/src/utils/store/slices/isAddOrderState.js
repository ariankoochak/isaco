import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    isAddOrderState: false,
};

export const isAddOrderStateSlice = createSlice({
    name: "isAddOrderState",
    initialState,
    reducers: {
        on: (state) => {
            state.isAddOrderState = true;
        },
        off: (state) => {
            state.isAddOrderState = false;
        },
    },
});

// Action creators are generated for each case reducer function
export const { on,off } = isAddOrderStateSlice.actions;

export default isAddOrderStateSlice.reducer;
