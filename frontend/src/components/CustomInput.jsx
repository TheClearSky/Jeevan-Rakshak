import "./CustomInput.css";
import {useId} from 'react';

export default function({label:p_label,name:p_name,type:p_type,value:p_value,handlechange:p_handlechange})
{
    const ID=useId();
    return (
    <div className="formele">
        <label htmlFor={ID}>{p_label}</label>
        <input id={ID} name={p_name} type={p_type} value={p_value} onChange={p_handlechange} />
    </div>
    )
}