import React from 'react';
import ReactDom from 'react-dom';
import css from "./css/scoreboard.css"

export default function App() {

    return (
        <h1 className={css.MainContainer}>TEST TEST</h1>
    );

}

ReactDom.render(<App />, document.querySelector("#react"));