import "./Rightpanel.css";
import {useState } from 'react';
import UserIcon from "./../../assets/UserIcon.png"
import CustomInput from "../CustomInput";


export default function({setPage:p_setPage})
{
    const [formData,setFormData]=useState({
        email:"",
        password:""
    });
    function handleChange(e)
    {
        // console.log(e);
        const {name,value}=e.target;
        setFormData((prevFormData)=>({
            ...prevFormData,
            [name]:value
        }))
    }
    function handleSubmit(e)
    {
        e.preventDefault();
        console.log(formData);
        // p_setPage("UserDetails");
        p_setPage("LoggedIn");
    }
    return (
    <form method="post" onSubmit={handleSubmit} className="rightpanel">
        <img className="usericon" src={UserIcon}/>
        <div className="rightpanelheading">
            Sign Up/Log In
        </div>
            <CustomInput label="Email:" name="email" type="text" value={formData.email} handlechange={handleChange} />
            <CustomInput label="Password:" name="password" type="password" value={formData.password} handlechange={handleChange} />
        <button type="submit">Sign Up/Log In</button>
    </form>
    )
}