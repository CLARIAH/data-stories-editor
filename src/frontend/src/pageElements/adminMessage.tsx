import React from 'react';
import {useState, useEffect} from "react";

function AdminMessage() {
    const [message, setMessage] = useState("Je veter zit los!");
    const [showMessage, setShowMessage] = useState(true);

    return(
        <>
            {message !== "" && showMessage && <div className="userMessage">{message}<div className="userMessageSwitchOff">Close</div></div>}
        </>
    )
}

export default AdminMessage