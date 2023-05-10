import React from 'react';
import ReactDom from 'react-dom';
import 'bootstrap/dist/css/bootstrap.min.css';

import MainContainer from './components/MainContainer.jsx'
import {store} from './store/store.jsx'
import {Provider} from "react-redux";

function App() {

    return (
        <MainContainer />
    );

}

const root = ReactDom.createRoot(document.querySelector("#react"));
root.render(
    <Provider store={store}>
        <App />
    </Provider>
);