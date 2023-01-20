
export async function addEntry ( entry ) {
    const url = '/api/Entry';
    const response = await fetch ( url , {
        method : 'POST' ,
        headers : {
            'Content-Type' : 'application/json' ,
        } ,
        body : JSON.stringify(entry),
    });
    return await response.json();
}

export async function getEntries () {
    try {
        const url = '/api/Entry';
        const response = await fetch ( url );
        return await response.json();
    } catch (error) {
        console.log(error);
        return [];
    }

}