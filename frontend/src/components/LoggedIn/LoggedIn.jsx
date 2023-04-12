import "./LoggedIn.css"
import TickIcon from "./../../assets/TickIcon.png"
import InnerPanel from "../InnerPanel"

export default function({firstregister:p_firstregister,setPage:p_setPage})
{
    return <>
        <InnerPanel>
            <div className="loggedin">
                <img className="tickicon" src={TickIcon}/>
                <div className="loggedinheading">
                    {(p_firstregister)?"User Registered Successfully!":"Logged In!"}
                </div>
                <div className="loggedinheading">
                    Welcome User
                </div>
                <button className="designbutton" onClick={()=>p_setPage("HomePage")}>Next</button>
            </div>
        </InnerPanel>
    </>
}