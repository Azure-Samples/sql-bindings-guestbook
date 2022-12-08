import React from 'react'

export const AddEntry = ({ onChangeForm, addEntry }) => {
    return(
        <div className="container">
            <div className="row">
                <div className="col-md-12 mrgnbtm">
                    <h4 className='pass-blue'>Add Entry</h4>
                    <form>
                        <div className="row">
                            <div className="form-group col-md-6">
                                {/* <label htmlFor="newEntry">Guestbook Entry:</label> */}
                                <textarea className="form-control" id="newEntry" name="newEntry" rows="3" onChange={(e) => onChangeForm(e)} maxLenth={3000}></textarea>
                            </div>
                        </div>
                        <div className='row bottomrow'>
                            <div className="col-md-6"><button type="button" onClick= {(e) => addEntry()} className="btn btn-success">Submit</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    )
}
