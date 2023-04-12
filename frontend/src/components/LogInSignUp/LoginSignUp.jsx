import Leftpanel from "./Leftpanel.jsx";
import Rightpanel from "./Rightpanel.jsx";

export default function({setPage:p_setPage}) {

  return (
    <>
      <Leftpanel />
      <Rightpanel setPage={p_setPage}/>
    </>
  )
}