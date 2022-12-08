import './App.css';

import React, { useState, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Header } from './components/Header';
import { AddEntry } from './components/AddEntry';
import { Entries } from './components/Entries';
import { addEntry, getEntries } from './services/EntryService';

function App() {
    
    const [entries, setEntries] = useState([]);
    const [entry, setEntry] = useState({});

    const entryCreate = (e) => {
        // check that newEntry field is not empty
        if (entry.newEntry) {
            addEntry(entry).then(res => {
                console.log(res);
                // reset the page and add success message
                getEntries().then(res => {
                    setEntries(res);
                });
                document.getElementById("newEntry").value = "";
            });
        }
    }

    useEffect(() => {
        getEntries().then(res => {
            setEntries(res);
        });
    });

    const onChangeForm = (e) => {
        if (e.target.id === 'newEntry') {
            entry.newEntry = e.target.value;
        }
        setEntry(entry);
    }

    return (
        <div className="App">
            <Header />
            <div className="container mrgnbtm">
                <div className="row">
                    <AddEntry onChangeForm={onChangeForm} addEntry={entryCreate} />
                </div>
                <hr className='horizontal-border'></hr>
                <div className='row'>
                    <Entries entries={entries} />
                </div>
            </div>
        </div>
    );
}

export default App;