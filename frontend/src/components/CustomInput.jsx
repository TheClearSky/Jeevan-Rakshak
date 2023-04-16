import "./CustomInput.css";
import {useId} from 'react';

export default function({label:p_label,name:p_name,type:p_type,value:p_value,handlechange:p_handlechange,style:p_style,rootstyle:p_rootstyle})
{
    const ID=useId();
    return (
    <div className="formele" style={p_rootstyle}>
        <label htmlFor={ID}>{p_label}</label>
        <input id={ID} name={p_name} type={p_type} value={p_value} onChange={p_handlechange} style={p_style}/>
    </div>
    )
}