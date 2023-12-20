import React from 'react'
import { useSelector } from 'react-redux'

export default function Test() {
    const userLogin = useSelector((store) => store.userLogin.userLogin)
  return (
    <div>{console.log(userLogin)}</div>
  )
}
