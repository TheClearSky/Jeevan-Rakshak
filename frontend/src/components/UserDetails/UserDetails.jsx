import InnerPanel from "../InnerPanel"
import {useState } from 'react';
import UserIcon from "./../../assets/UserIcon.png"
import CustomInput from "../CustomInput";
import "./UserDetails.css";
import DatePicker from 'react-date-picker';
import 'react-date-picker/dist/DatePicker.css';
import 'react-calendar/dist/Calendar.css';

export default function()
{
    const [formData,setFormData]=useState({
        email:"",
        age:null,
        placeholder:""
    });
    function handleChange(e)
    {
        
        let name,value;
        if(e instanceof Date && !isNaN(e))
        {
            name="age";
            value=e;
        }
        else if(e===null)
        {
            name="age";
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
    function handleSubmit(e)
    {
        e.preventDefault();
        console.log(formData);
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
                <CustomInput label="Email:" name="email" type="text" value={formData.email} handlechange={handleChange} />
                <div className="formagediv">
                    <div className="formage">Age:</div>
                    <DatePicker className="datepicker" onChange={handleChange} value={formData.age} />
                </div>
                <CustomInput label="Placeholder:" name="placeholder" type="text" value={formData.placeholder} handlechange={handleChange} />
                <button name="age" type="submit">Next</button>
            </form>
        </InnerPanel>
        
    </>
}