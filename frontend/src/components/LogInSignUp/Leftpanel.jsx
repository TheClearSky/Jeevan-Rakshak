import "./Leftpanel.css";
import Logo from "./../../assets/Logo.png"
import LogoAnimation from "./../../assets/LogoAnimation.mp4"

export default function()
{
    return <div className="leftpanel">
        <img src={Logo} className="leftpanel-logo"/>
        {/* <video width="500" height="500" autoplay="autoplay" muted >
            <source src={LogoAnimation} type="video/mp4" />
            Your browser does not support the video tag.
        </video > */}
    </div>
}