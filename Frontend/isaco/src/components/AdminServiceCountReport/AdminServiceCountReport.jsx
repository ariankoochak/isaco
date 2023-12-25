import React from "react";

export default function AdminServiceCountReport() {
    return (
        <div className="admin-service-count-report-main-div">
            <h4>لیست موضوعات مراجعه</h4>
            <div className="line"></div>
            <div className="autoservice-count">
                <span className="autoservice">اتو سرویس</span>
                <span className="count">1 بار</span>
            </div>
            <div className="enginegearbox-count">
                <span className="enginegearbox">موتور و گیربکس</span>
                <span className="count">1 بار</span>
            </div>
            <div className="detailing-count">
                <span className="detailing">سرامیک و صافکاری</span>
                <span className="count">1 بار</span>
            </div>
            <div className="ohters-count">
                <span className="ohters">سایر</span>
                <span className="count">1 بار</span>
            </div>
            <div className="fronting-count">
                <span className="fronting">جلوبندی</span>
                <span className="count">1 بار</span>
            </div>
        </div>
    );
}
