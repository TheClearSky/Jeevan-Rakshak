import "./HomePage.css"
import NavBar from "./NavBar.jsx";
import HomeBody from "./HomeBody.jsx";
export default function({userInfo:p_userInfo})
{
    return <div className="homepage">
        <NavBar userInfo={p_userInfo}/>
        <HomeBody userInfo={p_userInfo}/>
    </div>
}