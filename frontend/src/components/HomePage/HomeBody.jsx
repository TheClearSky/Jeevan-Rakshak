import "./HomeBody.css"
import CustomInput from "../CustomInput";
import {useState} from 'react'
import FilterButton from "./../../assets/FilterButton.png"
import Card from "./Card";

export default function()
{
    let [searchString,setSearchString]=useState("");
    function handleChange(e)
    {
        setSearchString(e.target.value);
    }
    return <>
        <div className="homebody">
            <div className="search">
                <div className="searchboxandfilter">
                    <CustomInput label="Search:" name="search" type="text" value={searchString} handlechange={handleChange} />
                </div>
                <img src={FilterButton} className="filter"></img>
            </div>
        </div>
        <div className="cards">
            <Card name="Something" diseasebenefits="some disease" rupees={50000} minage={17} maxage={70}/>
            {/* <Card/>
            <Card/>
            <Card/>
            <Card/>
            <Card/> */}
        </div>
    </>
}