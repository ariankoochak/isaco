import React from 'react'
import './assets/styles/global.css'
import { BrowserRouter, Route, Routes} from "react-router-dom";
import LoginPage from './Layouts/LoginPage/LoginPage';
import HomePage from './Layouts/HomePage/HomePage';
import Test from './Layouts/Test/Test';

export default function App() {
  return (
      <>
          <BrowserRouter>
              <Routes>
                  <Route path="/" element={<HomePage />}></Route>
                  <Route path="/Login" element={<LoginPage />}></Route>
                  <Route path="/test" element={<Test />}></Route>
              </Routes>
          </BrowserRouter>
      </>
  );
}
