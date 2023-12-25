import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    OrdersList: [],
};

export const OrdersListSlice = createSlice({
    name: "OrdersList",
    initialState,
    reducers: {
        updateOrderList: (state, action) => {
            state.OrdersList = [ ...action.payload ];
        },
    },
});

// Action creators are generated for each case reducer function
export const { updateOrderList } = OrdersListSlice.actions;

export default OrdersListSlice.reducer;
