import "./InnerPanel.css";
export default function(props)
{
    return <div className="innerpanel">
        {props.children}
    </div>
}