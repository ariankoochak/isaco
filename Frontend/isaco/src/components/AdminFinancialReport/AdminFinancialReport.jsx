import React from 'react'
import pricePrettier from '../../services/utils/PricePrettier';
export default function AdminFinancialReport() {
  return (
      <div className="admin-financial-report-main-div">
          <h4>مجموع دریافتی ماه جاری</h4>
          <div className="line"></div>
          <span>{pricePrettier("4320000")}</span>
      </div>
  );
}
