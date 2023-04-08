import "./LoggedIn.css"
import TickIcon from "./../../assets/TickIcon.png"
import InnerPanel from "../InnerPanel"

export default function({firstregister})
{
    return <>
        <InnerPanel>
            <div className="loggedin">
                <img className="tickicon" src={TickIcon}/>
                <div className="loggedinheading">
                    {(firstregister)?"User Registered Successfully!":"Logged In!"}
                </div>
                <div className="loggedinheading">
                    Welcome User
                </div>
                <button className="designbutton">Next</button>
            </div>
        </InnerPanel>
    </>
}