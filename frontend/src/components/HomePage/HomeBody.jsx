import "./HomeBody.css"
import CustomInput from "../CustomInput";
import { useState, useEffect } from 'react'
import FilterButton from "./../../assets/FilterButton.png"
import Card from "./Card";
import FuzzySearch from 'fuzzy-search';

export default function () {

    let [cards,setCards]=useState([]);
    let [clickedCard,setClickedCard]=useState(null);

    const fetchData = async () => {
        const response = await fetch("https://health-website-dsa-default-rtdb.firebaseio.com/.json");
        const data= await response.json();
        setCards(data);
        // console.log(data);
    }

    useEffect(() => {
        fetchData();
    }, [])

    let [searchString, setSearchString] = useState("");
    function handleChange(e) {
        setSearchString(e.target.value);
    }
    const searcher = new FuzzySearch(cards, ['name'], {sort:true});
    const cardstodisplay=searcher.search(searchString);

    let cardcomponents;
    if(clickedCard===null)
    {
        cardcomponents=cardstodisplay.map((card,index)=>
        {
            return <Card key={card.id} name={card.name} diseasebenefits={card.disease} forgroup={card.incomegroup} minage={card.minage} maxage={card.maxage} description={card.body} linkToApply={card.link} enlarge={false} setClickedCard={setClickedCard} index={index}/>
        });
    }
    else
    {
        let card=cardstodisplay[clickedCard];
        cardcomponents=<Card key={card.id} name={card.name} diseasebenefits={card.disease} forgroup={card.incomegroup} minage={card.minage} maxage={card.maxage} description={card.body} linkToApply={card.link} enlarge={true} setClickedCard={setClickedCard}/>
    }
    return <>
        <div className="homebody">
            <div className={"search "+ ((clickedCard==null)?"":"hide")}>
                <div className="searchboxandfilter">
                    <CustomInput label="Search:" name="search" type="text" value={searchString} handlechange={handleChange} />
                </div>
                <img src={FilterButton} className="filter"></img>
            </div>
        </div>
        <div className="cards">
            {cardcomponents}
            
        </div>
    </>
}