import React from 'react'

export const Header = () => {

    const headerStyle = {

        width: '100%',
        padding: '2%',
        backgroundColor: "#000",
        color: 'white',
        textAlign: 'center'
    }

    return(
        <div>
            <div style={headerStyle}>
                <h1 className='primary-header'>PASS Summit Guestbook</h1>
                <h4>Powered by <a href="https://github.com/dzsquared/sqlbindings-guestbook-demo">Azure SQL bindings for Azure Functions</a></h4>
            </div>
        </div>
    )
}