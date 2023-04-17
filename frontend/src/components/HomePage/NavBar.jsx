import "./NavBar.css"
import Logo from "./../../assets/Logo.png"

export default function({buttons:p_buttons,currentButtonIndex:p_currentButtonIndex,setCurrentButtonIndex:p_setCurrentButtonIndex})
{
    
    return <>
        <div className="navandbackground">
            <nav>
                <img src={Logo} className="navlogo"/>
                <div className="navbuttons">
                    {/* <button className="navbutton activebutton">Home</button>
                    <button className="navbutton">FAQ</button>
                    <button className="navbutton" onClick={logout}>Log Out</button> */}
                    {
                        p_buttons.map(({buttonname,onClickfunc,changeActiveButton},index)=>
                        {
                            return <button 
                                key={buttonname} 
                                onClick={()=>
                                    {
                                        if(changeActiveButton)
                                        {
                                            p_setCurrentButtonIndex(index);
                                        }
                                        if(onClickfunc)
                                        {
                                            onClickfunc();
                                        }
                                    }
                                }
                                className={"navbutton "+((index===p_currentButtonIndex)?"activebutton":"")}
                            >
                                {buttonname}
                            </button>
                        })
                    }
                </div>
            </nav>
            
            <div className="backgroundbox"></div>
        </div>
    </>
}