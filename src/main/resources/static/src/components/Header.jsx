import React, {useEffect, useState} from 'react';

import css from '../css/scoreboard.css'
import Stack from "react-bootstrap/Stack";
import {get_current_username} from "../utils/api_requests.js";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faRightFromBracket} from "@fortawesome/free-solid-svg-icons";

export default function Header() {

    let [currentUsername, setCurrentUsername] = useState("");

    useEffect(() => {
        get_current_username().then((response) => response.text().then((username) => {
            setCurrentUsername(username);
        }))
    }, []);

    return (
        <Stack direction={"horizontal"} id={css.Header}>
            <img src="../../icon.svg" height="100%" style={{marginLeft: "5px"}}/>
            <p className={"h5 text-white"} style={{marginLeft: "10px"}}>{currentUsername}</p>
            <Stack direction={"horizontal"}
                   style={{justifyContent: "flex-end", width: "100%", paddingRight: "20px"}}>
                <a href='/logout'
                      className='btn btn-primary'
                      style={{backgroundColor: "#1976d2", border: "none"}}><FontAwesomeIcon icon={faRightFromBracket}/></a>
            </Stack>
        </Stack>
    );

}