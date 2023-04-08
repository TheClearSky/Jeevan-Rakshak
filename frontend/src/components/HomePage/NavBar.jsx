import "./NavBar.css"
import Logo from "./../../assets/Logo.png"
export default function()
{
    return <>
        <div className="navandbackground">
            <nav>
                <img src={Logo} className="navlogo"/>
                <div className="navbuttons">
                    <button className="navbutton activebutton">Home</button>
                    <button className="navbutton">FAQ</button>
                </div>
            </nav>
            
            <div className="backgroundbox"></div>
        </div>
    </>
}