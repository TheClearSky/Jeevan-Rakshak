import "./HomePage.css"
import NavBar from "./NavBar.jsx";
import HomeBody from "./HomeBody.jsx";
import { useState } from "react";
import { signOut } from "firebase/auth";
import { auth } from "../../firebase-config";
import FaqBody from "./FaqBody";

const logout = async () => {
    try{
        await signOut(auth);
    }
    catch(error)
    {
        console.log(error);
        
    }
}

export default function({userInfo:p_userInfo})
{
    let buttons=
    [
        {
            buttonname:"Home",
            onClickfunc:null,
            changeActiveButton:true
        },
        {
            buttonname:"FAQ",
            onClickfunc:null,
            changeActiveButton:true
        },
        {
            buttonname:"Log Out",
            onClickfunc:logout,
            changeActiveButton:false
        }
    ];
    let [currentButtonIndex,setCurrentButtonIndex]=useState(0);

    let currentPageToRender;
    switch(buttons[currentButtonIndex].buttonname)
    {
        case "Home":
            currentPageToRender=<HomeBody userInfo={p_userInfo}/>;
            break;
        case "FAQ":
            currentPageToRender=<FaqBody />
            break;
        default:
            currentPageToRender="This page isn't defined";
    }
    return <div className="homepage">
        <NavBar userInfo={p_userInfo} buttons={buttons} currentButtonIndex={currentButtonIndex} setCurrentButtonIndex={setCurrentButtonIndex}/>
        {currentPageToRender}
    </div>
}