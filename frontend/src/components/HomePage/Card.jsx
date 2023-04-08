import "./Card.css"
import { useState } from "react";

export default function({name:p_name,diseasebenefits:p_disease_benefits,rupees:p_rupees,minage:p_minage,maxage:p_maxage})
{
    let percentage=p_rupees/20000;
    percentage=Math.round(percentage);
    if(percentage<0)
    {
        percentage=0;
    }
    if(percentage>100)
    {
        percentage=100;
    }
    let gradient="linear-gradient(90deg, rgba(4, 22, 22, 1)";
    if(percentage>15)
    {
        gradient+=`0%, rgba(4, 22, 22, 1) 15.5%, rgba(36, 124, 124, 1) 15.51%, rgba(36, 124, 124, 1)`;
    }
    if(percentage>48)
    {
        gradient+=` 48.5%, rgba(94, 247, 247) 48.51%, rgb(94, 247, 247)`;
    }
    gradient+=`${percentage}%,rgba(0,0,0,0) ${percentage+0.01}%)`;
    return <div className="card">
        <div className="cardname">
            {p_name}
        </div>
        <div className="cardbody">
            <div className="cardsubheading">
                Disease Benefits: {p_disease_benefits}
            </div>
            <div className="bars">
                <div>
                    Upto: {p_rupees}
                </div>
                <div className="bar1" style={{ background: gradient }}>

                </div>
            </div>
            <div className="bars">
                <div>
                    Age Group: {p_minage}-{p_maxage}
                </div>
                <div className="bar2" style={{background: `linear-gradient(90deg, #B40000 ${p_minage}%, #041616 ${p_minage+0.01}%, #041616 ${p_maxage}%, #B40000 ${p_maxage+0.01}%)`}}>
                    
                </div>
            </div>
        </div>
    </div>
}