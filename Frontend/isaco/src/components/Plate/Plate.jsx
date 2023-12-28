import React from 'react'
import codeToPlate from '../../services/utils/CodeToPlate'
export default function Plate({plateCode}) {
    const plate = codeToPlate(plateCode)
  return (
    <div className='plate-main-div'>
        <div className='plate-region'>{plate[3]}</div>
        <div className='spliter'></div>
        <div className='plate-odd-even'>{plate[2]}</div>
        <div className='plate-alphabet'>{plate[1]}</div>
        <div className='plate-2num'>{plate[0]}</div>
    </div>
  )
}
