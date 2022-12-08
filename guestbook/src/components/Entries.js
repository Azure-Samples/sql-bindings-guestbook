import React from 'react';

export const Entries = ( { entries } ) => {
    if (entries.length === 0) {
        return <p>There are no entries</p>;
    }
    const EachEntry = ( entry, index) => {
        return (
            <div>
                <div key={index} className="row">
                    <p>{entry.TextEntry}</p>
                </div>
                <hr></hr>
            </div>
        );
    };

    const entryList = entries.map((entry, index) => EachEntry(entry, index));

    return (
        <div className='container'>
            <h4 className='pass-green'>Recent Entries</h4>
            {entryList}
        </div>
    );
};