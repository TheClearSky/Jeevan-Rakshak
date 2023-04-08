import { useState } from 'react'
import './App.css'
import LoginPage from "./LogInSignUp/LoginSignUp.jsx";
import UserDetails from './UserDetails/UserDetails';
import LoggedIn from './LoggedIn/LoggedIn';
import HomePage from './HomePage/HomePage';

function App() {

  return (
    <div className="App">
      {/* <LoginPage /> */}
      {/* <UserDetails/> */}
      {/* <LoggedIn firstregister={false}/> */}
      <HomePage/>
    </div>
  )
}

export default App
