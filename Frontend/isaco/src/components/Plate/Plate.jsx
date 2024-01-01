import React from 'react'
import codeToPlate from '../../services/utils/CodeToPlate'
import plateStyle from '../../assets/styles/plateStyle.module.css'
import iranFlagSrc from '../../assets/images/iranFlag.png'
export default function Plate({plateCode}) {
    const plate = codeToPlate(plateCode)
  return (
      <>
          <div>
              <div className={`${plateStyle.mainPlate} set-yekan-bakh-bold`}>
                  <div className={plateStyle.regionPlate}>
                      <span className={plateStyle.iranLable}>ایران</span>
                      <span className={plateStyle.regionCode}>{plate[3]}</span>
                  </div>
                  <div className={plateStyle.oddOrEvenPlate}>
                      <span>{plate[2]}</span>
                  </div>
                  <div className={plateStyle.alphabetPlate}>
                      <span>{plate[1]}</span>
                  </div>
                  <div className={plateStyle.numberPlate}>
                      <span>{plate[0]}</span>
                  </div>
              </div>
              <div className={plateStyle.blueIrLabel}>
                  <img src={iranFlagSrc} alt="iran flag" />
                  <span>I.R.</span>
                  <span>IRAN</span>
              </div>
          </div>
      </>
  );
}
