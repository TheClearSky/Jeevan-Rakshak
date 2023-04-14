import Leftpanel from "./Leftpanel.jsx";
import Rightpanel from "./Rightpanel.jsx";

export default function({setPage:p_setPage,setAutoChangeLoginPage:p_setAutoChangeLoginPage,formData:p_formData,handleChange:p_handleChange}) {

  return (
    <>
      <Leftpanel />
      <Rightpanel setPage={p_setPage} setAutoChangeLoginPage={p_setAutoChangeLoginPage} formData={p_formData} handleChange={p_handleChange}/>
    </>
  )
}