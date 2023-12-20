import React from 'react'
import './assets/styles/global.css'
import { BrowserRouter, Route, Routes} from "react-router-dom";
import LoginPage from './Layouts/LoginPage/LoginPage';
import HomePage from './Layouts/HomePage/HomePage';
import AdminPage from './Layouts/AdminPage/AdminPage';

export default function App() {
  return (
      <>
          <BrowserRouter>
              <Routes>
                  <Route path="/" element={<HomePage />}></Route>
                  <Route path="/Login" element={<LoginPage />}></Route>
                  <Route path="/Employee/Admin" element={<AdminPage />}></Route>
              </Routes>
          </BrowserRouter>
      </>
  );
}
