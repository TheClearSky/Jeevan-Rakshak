import "./Card.css"

export default function({name:p_name,diseasebenefits:p_disease_benefits,forgroup:p_forgroup,minage:p_minage,maxage:p_maxage,description:p_description,linkToApply:p_linkToApply,contact:p_contact,enlarge:p_enlarge,setClickedCard:p_setClickedCard,index:p_index})
{
    let nolowerlimitofage=false;
    let noupperlimitofage=false;
    if(p_minage<0)
    {
        p_minage=0;
        nolowerlimitofage=true;
    }
    if(p_maxage<0)
    {
        p_maxage=100;
        noupperlimitofage=true;
    }

    let agestring;
    if(nolowerlimitofage&&noupperlimitofage)
    {
        agestring=`All ages`
    }
    else if(nolowerlimitofage)
    {
        agestring=`<${p_maxage}`
    }
    else if(noupperlimitofage)
    {
        agestring=`${p_minage}+`
    }
    else
    {
        agestring=`${p_minage}-${p_maxage}`
    }
    // let percentage=p_rupees/20000;
    // percentage=Math.round(percentage);
    // if(percentage<0)
    // {
    //     percentage=0;
    // }
    // if(percentage>100)
    // {
    //     percentage=100;
    // }
    // let gradient="linear-gradient(90deg, rgba(4, 22, 22, 1)";
    // if(percentage>15)
    // {
    //     gradient+=`0%, rgba(4, 22, 22, 1) 15.5%, rgba(36, 124, 124, 1) 15.51%, rgba(36, 124, 124, 1)`;
    // }
    // if(percentage>48)
    // {
    //     gradient+=` 48.5%, rgba(94, 247, 247) 48.51%, rgb(94, 247, 247)`;
    // }
    // gradient+=`${percentage}%,rgba(0,0,0,0) ${percentage+0.01}%)`;
    return <div onClick={(p_enlarge)?null:(()=>p_setClickedCard(p_index))} className={`card `+((p_enlarge)?"enlarge":"")}>
        <button className="cardbutton designbutton smallbutton" onClick={()=> p_setClickedCard(null)}>Back</button>
        <div className="cardname">
            {p_name}
        </div>
        <div className="outerbody">
            <div className="cardbody">
                <div className="cardsubheading">
                    Disease Benefits: {p_disease_benefits}
                </div>
                <div className="bars">
                    <div>
                        For Group: {p_forgroup}
                    </div>
                    {/* <div className="bar1" style={{ background: gradient }}>

                    </div> */}
                </div>
                <div className="bars">
                    <div>
                        Age Group: {agestring}
                    </div>
                    <div className="bar2" style={{background: `linear-gradient(90deg, #AFAFAF ${p_minage}%, #B40000 ${p_minage+0.01}%, #B40000 ${p_maxage}%, #AFAFAF ${p_maxage+0.01}%)`}}>
                        
                    </div>
                </div>
                
            </div>
            <div className="descriptiontitle">
                Description
            </div>
            <div className="descriptionbody">
                {p_description}
            </div>
            <div className="descriptiontitle">
                Contact Helpline
            </div>
            <div className="descriptionbody">
                {p_contact}
            </div>
            <button className="cardbutton designbutton smallbutton" onClick={()=>window.open(p_linkToApply,'_blank')} >Link To Apply</button>
        </div>
    </div>
}