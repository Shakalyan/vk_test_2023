import React, {useEffect, useState} from 'react';

import css from '../css/scoreboard.css'
import Stack from "react-bootstrap/Stack";
import {get_current_username} from "../utils/api_requests.js";

export default function Header() {

    let [currentUsername, setCurrentUsername] = useState("test");

    useEffect(() => {
        get_current_username().then((response) => response.text().then((username) => {
            setCurrentUsername(username);
        }))
    }, []);

    return (
        <Stack direction={"horizontal"} id={css.Header}>
            <img src="../../icon.svg" height="100%" style={{marginLeft: "5px"}}/>
            <p className={"h5 text-white"} style={{marginLeft: "10px"}}>user: {currentUsername}</p>
        </Stack>
    );

}