import React, { useEffect, useState } from 'react'
import "./FaqBody.css"
import CustomInput from '../CustomInput';
import { getDatabase, ref, set, child, get } from "firebase/database";

async function fetchqanda(setQandA)
{
    const db = getDatabase();
    const dbRef = ref(db);
    let result= await get(child(dbRef, "qanda/"));
    setQandA(result.val());
}
async function updateqanda(qanda) {
    if(qanda.length===0)
    {
        return;
    }
    const db = getDatabase();
    await set(ref(db, "qanda/"), qanda );
}
export default function() {
    let [qanda,setQandA]=useState([]);
    
    let [openState,setOpenState]=useState(qanda.map(()=>false));
    function toggleState(index)
    {
        setOpenState((prevState)=>{
            let newState=[...prevState];
            newState[index]=!newState[index];
            return newState;
        })
    }
    useEffect(()=>
    {
        fetchqanda(setQandA)
    },[]);
    // useEffect(()=>
    // {
    //     updateqanda(qanda);
    // },[qanda]);
    let [newQuestionText,setNewQuestionText]=useState("");
    function addQuestion()
    {
        if(newQuestionText.length>0)
        {
            qanda.push({
                question:newQuestionText,
                answer:""
            })
        }
        setOpenState((prevState)=>{
            let newState=[...prevState];
            newState.push(false);
            return newState;
        })
        setNewQuestionText("");
    }
    return (
        <div className='faqbody'>
            <div className="faqheading">
                How can we help you?
            </div>
            <div className="questions">
                <div className="newquestion">
                    <CustomInput rootstyle={{flexDirection:"row",padding:"40px 20px",width:"100%",alignItems:"center"}} style={{whiteSpace:"wrap",width:"100%",maxWidth:"1000px"}} label="New Question:" name="newquestion" type="text" value={newQuestionText} handlechange={(e)=>setNewQuestionText(e.target.value)}/>
                    <button className="designbutton" style={{width:"200px"}} onClick={addQuestion}>Add Question</button>
                </div>
                {qanda.map(({question,answer},index)=>{
                    return (<div key={question} className={"questionelement "+(openState[index]?"opened":"")}>
                    <div className="question">
                        <div className="questionandlabel">  
                            <div className="questionlabel">Q:</div>
                            <div className="questiontext">{question}</div>
                        </div>
                        <div className="plus" onClick={()=>toggleState(index)}>{openState[index]?"-":"+"}</div>
                    </div>
                    <div className="answer">
                        <div className="answerlabel">Ans:</div>
                        <div className={"answertext "+((answer.length>0)?"":"unanswered")}>{((answer.length>0)?answer:"Unanswered")}</div>
                    </div>
                </div>
                )})}
            </div>
        </div>
    )
}
