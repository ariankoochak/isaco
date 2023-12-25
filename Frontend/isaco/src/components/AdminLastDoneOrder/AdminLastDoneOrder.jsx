import React from 'react'
import CarsCard from '../CarsCard/CarsCard'

export default function AdminMostCarOrderReport() {
  return (
      <div className="admin-most-car-order-report">
          <h3>آخرین خودرو های انجام شده</h3>
          <div className="line"></div>
          <div className="cars-card-container">
              <CarsCard />
              <CarsCard />
              <CarsCard />
              <CarsCard />
          </div>
      </div>
  );
}
