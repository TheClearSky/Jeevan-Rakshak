import "./Rightpanel.css";
import {useState } from 'react';
import UserIcon from "./../../assets/UserIcon.png"
import CustomInput from "../CustomInput";
import { auth } from "../../firebase-config";
import {signInWithEmailAndPassword } from "firebase/auth";
import "./../ErrorText.css";


export default function({setPage:p_setPage,setAutoChangeLoginPage:p_setAutoChangeLoginPage,formData:p_formData,handleChange:p_handleChange})
{
    
    let [errorText,setErrorText]=useState("");
    

    
    async function handleSubmit(e)
    {
        e.preventDefault();
        p_setAutoChangeLoginPage(false);
        try{
            const user=await signInWithEmailAndPassword(auth,p_formData.email,p_formData.password);
            
            p_setPage("LoggedIn");
        }
        catch(error)
        {
            switch(error.code)
            {
                case 'auth/user-not-found':
                    setErrorText("");
                    p_setPage("UserDetails");
                    break;
                default:
                    setErrorText(error.code.substring(5).replaceAll('-',' '));
            }
        }
        
    }
    return (
    <form method="post" onSubmit={handleSubmit} className="rightpanel">
        <img className="usericon" src={UserIcon}/>
        <div className="rightpanelheading">
            Sign Up/Log In
        </div>
            {(errorText=="")?"":<div className="errortext">{errorText}</div>}
            <CustomInput label="Email:" name="email" type="text" value={p_formData.email} handlechange={p_handleChange} />
            <CustomInput label="Password:" name="password" type="password" value={p_formData.password} handlechange={p_handleChange} />
        <button type="submit">Sign Up/Log In</button>
    </form>
    )
}