import { useState } from 'react'
import './App.css'
import LoginPage from "./LogInSignUp/LoginSignUp.jsx";
import UserDetails from './UserDetails/UserDetails';
import LoggedIn from './LoggedIn/LoggedIn';
import HomePage from './HomePage/HomePage';

function App() {
  let [page,setPage]=useState("LoginPage");
  let pagetodisplay;
  if(page==="LoginPage")
  {
    pagetodisplay=<LoginPage setPage={setPage}/>;
  }
  else if(page==="UserDetails")
  {
    pagetodisplay=<UserDetails setPage={setPage}/>;
  }
  else if(page==="LoggedIn")
  {
    pagetodisplay=<LoggedIn firstregister={false} setPage={setPage}/>
  }
  else if(page==="UserRegistered")
  {
    pagetodisplay=<LoggedIn firstregister={true} setPage={setPage}/>
  }
  else if(page==="HomePage")
  {
    pagetodisplay=<HomePage setPage={setPage}/>
  }
  return (
    <div className="App">
      {/* <LoginPage /> */}
      {/* <UserDetails/> */}
      {/* <LoggedIn firstregister={false}/> */}
      {/* <HomePage /> */}
      {pagetodisplay}
    </div>
  )
}

export default App
