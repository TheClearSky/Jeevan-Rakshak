import { useEffect, useState } from 'react'
import './App.css'
import LoginPage from "./LogInSignUp/LoginSignUp.jsx";
import UserDetails from './UserDetails/UserDetails';
import LoggedIn from './LoggedIn/LoggedIn';
import HomePage from './HomePage/HomePage';

import { auth } from "./../firebase-config";
import {onAuthStateChanged} from "firebase/auth";

import { readUserData } from "./../usermanagement.js";

function App() {

  let [userInfo,setUserInfo]=useState({
    loggedIn:false,
    user:{}
  });

  let [autoChangeLoginPage,setAutoChangeLoginPage]=useState(true);

  useEffect(()=>onAuthStateChanged(auth,async (currenUser)=>{
    // console.log(currenUser);
      if(currenUser!==null)
      {
        let data = await readUserData(currenUser);
        // console.log(currenUser,data);
        currenUser={...currenUser,...data};
      }
      setUserInfo(()=>{
        return {
          loggedIn:(currenUser!==null),
          user:currenUser
        }
      })
  }),[])

  

  
  let [page,setPage]=useState("LoginPage");

  useEffect(()=>{
    if(page=="HomePage")
    {
      setAutoChangeLoginPage(true);
    }
  },[page]);

  const [formData,setFormData]=useState({
      email:"",
      password:"",
      dob:null,
      name:""
  });

  function handleChange(e)
  {
      
      let name,value;
      if(e instanceof Date && !isNaN(e))
      {
          name="dob";
          value=e;
      }
      else if(e===null)
      {
          name="dob";
          value=null;
      }
      else
      {
          ({name,value}=e.target);
      }
      setFormData((prevFormData)=>({
          ...prevFormData,
          [name]:value
      }))
  }

  useEffect(()=>{
    if(autoChangeLoginPage)
    {
      if(userInfo.loggedIn)
      {
        setPage("HomePage");
      }
      else
      {
        setPage("LoginPage");
      }
    }
  },[userInfo.loggedIn])

  let pagetodisplay;
  if(page==="LoginPage")
  {
    pagetodisplay=<LoginPage setPage={setPage} setAutoChangeLoginPage={setAutoChangeLoginPage} formData={formData} handleChange={handleChange}/>;
  }
  else if(page==="UserDetails")
  {
    pagetodisplay=<UserDetails setPage={setPage} formData={formData} handleChange={handleChange}/>;
  }
  else if(page==="LoggedIn")
  {
    pagetodisplay=<LoggedIn firstregister={false} setPage={setPage} />
  }
  else if(page==="UserRegistered")
  {
    pagetodisplay=<LoggedIn firstregister={true} setPage={setPage} />
  }
  else if(page==="HomePage")
  {
    pagetodisplay=<HomePage setPage={setPage} userInfo={userInfo}/>
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
