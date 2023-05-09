import React from 'react';
import Header from './Header.jsx';
import css from '../css/scoreboard.css'
import NavPanel from "./NavPanel.jsx";
import Scoreboard from "./Scoreboard.jsx";
import {Stack} from "react-bootstrap";
import Footer from "./Footer.jsx";

export default function MainContainer() {

    return (
        <Stack id={css.MainContainer} className={css.pageWidth}>
            <Header />
            <NavPanel />
            <Scoreboard />
            <Footer />
        </Stack>
    );

}