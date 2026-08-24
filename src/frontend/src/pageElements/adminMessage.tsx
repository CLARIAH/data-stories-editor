import React from 'react';
import {useState, useEffect} from "react";
import {API_URL} from "../misc/functions";

function AdminMessage() {
    const [message, setMessage] = useState("");
    const [showMessage, setShowMessage] = useState(true);
    const [activateTimer, setActivateTimer] = useState(true);
    const [loading, setLoading] = useState(true);

    async function get_message() {
        const response = await fetch(API_URL + 'get_message');
        const json = await response.json();
        if (json.message !== message) {
            setMessage(json.message);
            setShowMessage(true);
        }
        setLoading(false);
        setActivateTimer(!activateTimer);
    }

    useEffect(() => {
        if (loading) get_message()
            else setTimeout(get_message, 120000);
    }, [activateTimer]);

    return(
        <>
            {message !== "" && showMessage && <div className="userMessage">{message}<div className="userMessageSwitchOff" onClick={() => setShowMessage(false)}>Close (x)</div></div>}
        </>
    )
}

export default AdminMessage