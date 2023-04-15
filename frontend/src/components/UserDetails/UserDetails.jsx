import InnerPanel from "../InnerPanel"
import {useState } from 'react';
import UserIcon from "./../../assets/UserIcon.png"
import CustomInput from "../CustomInput";
import "./UserDetails.css";
import DatePicker from 'react-date-picker';
import 'react-date-picker/dist/DatePicker.css';
import 'react-calendar/dist/Calendar.css';

import { auth } from "../../firebase-config";
import { createUserWithEmailAndPassword } from "firebase/auth";
import "./../ErrorText.css";

import { writeUserData } from "./../../usermanagement.js";

export default function({setPage:p_setPage,formData:p_formData,handleChange:p_handleChange})
{

    let [errorText,setErrorText]=useState("");

    async function handleSubmit(e)
    {
        e.preventDefault();
        try{
            const user= await createUserWithEmailAndPassword(auth,p_formData.email,p_formData.password);
            // console.log(user,p_formData);
            writeUserData(user.user,p_formData.name,p_formData.dob);
            p_setPage("UserRegistered");
        }
        catch(error)
        {
            switch(error.code)
            {
                case 'auth/email-already-in-use':
                    setErrorText("");
                    p_setPage("LoginPage");
                    break;
                default:
                    setErrorText(error.code.substring(5).replaceAll('-',' '));
            }
        }
        
    }
    return <>
        <InnerPanel>
            <form method="post" onSubmit={handleSubmit} className="userdetails">
                <img className="usericon" src={UserIcon}/>
                <div className="userdetailsheading">
                    Welcome User
                </div>
                <div className="userdetailsheading">
                    We want you to fill some basic details
                </div>
                {(errorText=="")?"":<div className="errortext">{errorText}</div>}
                <CustomInput label="Email:" name="email" type="text" value={p_formData.email} handlechange={p_handleChange} />
                <CustomInput label="Password:" name="password" type="password" value={p_formData.password} handlechange={p_handleChange} />
                <CustomInput label="Name:" name="name" type="text" value={p_formData.name} handlechange={p_handleChange} />
                
                <div className="formdobdiv">
                    <div className="formdob">Date of birth:</div>
                    <DatePicker className="datepicker" onChange={p_handleChange} value={p_formData.dob} />
                </div>
                <button type="submit">Next</button>
            </form>
        </InnerPanel>
        
    </>
}