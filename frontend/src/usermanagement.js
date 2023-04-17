import { getDatabase, ref, set, child, get } from "firebase/database";

export async function readUserData(userobject)
{
    // console.log(userobject);
    const db = getDatabase();
    const dbRef = ref(db);
    let result= await get(child(dbRef, 'users/' + userobject.uid));
    result=result.val();
    result.dob=new Date(Date.parse(result.dob));
    return result;
    // console.log(result);
}

export async function writeUserData(userobject, inp_name, inp_dob) {
  
    const db = getDatabase();
    await set(ref(db, 'users/' + userobject.uid), {
        name: inp_name,
        dob: inp_dob.toString()
    });
}
