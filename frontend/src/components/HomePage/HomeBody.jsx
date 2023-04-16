import "./HomeBody.css"
import CustomInput from "../CustomInput";
import { useState, useEffect } from 'react'
import FilterButton from "./../../assets/FilterButton.png"
import Card from "./Card";
import FuzzySearch from 'fuzzy-search';
import Slider from 'rc-slider';
import 'rc-slider/assets/index.css';

import {useId} from 'react';

import Dropdown from 'react-dropdown';
import 'react-dropdown/style.css';

function areIntersecting(left1,right1,left2,right2)
{
    return ((left1 <= right2) && (left2 <= right1));
}

export default function () {
    const govtOptions = [
        'All', 'Central', 'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jammu and Kashmir', 'Jharkhand', 'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
      ];
    const [defaultOption,setDefaultOption] = useState(govtOptions[0]);
    const minageID=useId();
    const maxageID=useId();
    let [cards,setCards]=useState([]);
    let [clickedCard,setClickedCard]=useState(null);

    let [showFilters,setShowFilters]=useState(false);
    function toggleFilters(){setShowFilters((prevFilters)=>!prevFilters)};

    let [sliderPositions,setSliderPositions]=useState([0,150]);

    const fetchData = async () => {
        const response = await fetch("https://health-website-dsa-default-rtdb.firebaseio.com/schemelist.json");
        const data= await response.json();
        setCards(data);
        // console.log(data);
    }

    useEffect(() => {
        fetchData();
    }, [])

    function onSliderChange(newSliderPositions)
    {
        setSliderPositions(newSliderPositions);
    }

    function onInputAgeChange(e)
    {
        let {name,value}=e.target;
        if(name==="minage")
        {
            setSliderPositions((prevSliderPositions)=>
            {
                
                if(prevSliderPositions[1]<value)
                {
                    value=prevSliderPositions[1];
                }
                let arr=[value,prevSliderPositions[1]];
                return arr;
            });
        }
        else
        {
            setSliderPositions((prevSliderPositions)=>
            {
                if(prevSliderPositions[0]>value)
                {
                    value=prevSliderPositions[0];
                }
                let arr=[prevSliderPositions[0],value];
                return arr;
            });
        }
    }

    let [searchString, setSearchString] = useState("");
    function handleChange(e) {
        setSearchString(e.target.value);
    }
    const searcher = new FuzzySearch(cards, ['name'], {sort:true});
    let cardstodisplay=searcher.search(searchString);
    if(defaultOption!=="All")
    {
        cardstodisplay=cardstodisplay.filter((card)=>(card.category===defaultOption));
    }

    cardstodisplay=cardstodisplay.filter((card)=>
    {
        return areIntersecting(sliderPositions[0],sliderPositions[1],(card.minage==-1)?0:card.minage,(card.maxage==-1)?150:card.maxage);
    });

    let cardcomponents;
    if(clickedCard===null)
    {
        cardcomponents=cardstodisplay.map((card,index)=>
        {
            return <Card key={card.id} name={card.name} diseasebenefits={card.disease} forgroup={card.incomegroup} minage={card.minage} maxage={card.maxage} description={card.body} linkToApply={card.link} contact={card.contact} enlarge={false} setClickedCard={setClickedCard} index={index}/>
        });
    }
    else
    {
        let card=cardstodisplay[clickedCard];
        cardcomponents=<Card key={card.id} name={card.name} diseasebenefits={card.disease} forgroup={card.incomegroup} minage={card.minage} maxage={card.maxage} description={card.body} linkToApply={card.link} contact={card.contact} enlarge={true} setClickedCard={setClickedCard}/>
    }
    return <>
        <div className="homebody">
            <div className={"search "+ ((clickedCard==null)?"":"hide")}>
                <div className="searchboxandfilter">
                    <CustomInput label="Search:" name="search" type="text" value={searchString} handlechange={handleChange} style={{minWidth:"100px",width:"300px",maxWidth:"500px"}} />
                </div>
                <img src={FilterButton} onClick={toggleFilters} className="filterbutton"></img>
            </div>
            {(showFilters)?
            <div className="filter">
                <div className="filtertitle">Filters</div>
                <div className="slider">
                    <Slider 
                        range pushable draggableTrack 
                        allowCross={false} 
                        value={sliderPositions} 
                        min={0}
                        max={150}
                        onChange={onSliderChange} 
                        style={{width:"80%",margin:"3% 10%"}}
                        trackStyle={[{ backgroundColor: '#041616', height:"6px" }]}
                        handleStyle={[{ background: 'radial-gradient(circle at center, #041616 50.54%, #247C7C 50.55%)', opacity:1, width:"30px", height:"30px", marginTop:"-11px" }, 
                        { background: 'radial-gradient(circle at center, #041616 50.54%, #247C7C 50.55%)', opacity:1, width:"30px", height:"30px", marginTop:"-11px" }]}
                        railStyle={{ backgroundColor: '#858585', height:"6px" }} 
                    />
                </div>
                <div className="agefields">
                    <div className="agefield">
                        <label htmlFor={minageID}>Min age:</label>
                        {(sliderPositions[0]!==0)?<input id={minageID} name="minage" type="number" value={sliderPositions[0]} onChange={onInputAgeChange}  min="0" max="150"/>:"All"}
                    </div>
                    <div className="agefield">
                        <label htmlFor={maxageID}>Max age:</label>
                        {(sliderPositions[1]!==150)?<input id={maxageID} name="maxage" type="number" value={sliderPositions[1]} onChange={onInputAgeChange} min="0" max="150"/>:"All"}
                    </div>
                </div>
                <div className="dropdowncontainer">
                    Govt:
                    <Dropdown className="dropdown" controlClassName='dropdowncurrent'  options={govtOptions}  value={defaultOption} onChange={({value})=>setDefaultOption(value)}/>
                </div>
            </div>
            :
            ""
            }
        </div>
        

        <div className="cards">
            {(cardcomponents.length==0)?"No scheme available":cardcomponents}
            
        </div>
    </>
}