import React, {useEffect, useState} from 'react';
import {Dropdown, Stack} from "react-bootstrap";
import {useDispatch} from "react-redux";
import {get_categories, get_stat} from "../utils/api_requests.js";
import {changeCurrentStatistics} from "../store/actions/changeCurrentStatistics.jsx";

export default function NavPanel() {

    let [categoriesList, setCategoriesList] = useState([]);

    useEffect(() => {
        get_categories().then((response) => response.json().then((categoriesList) => {
            setCategoriesList(categoriesList.map((category) =>
                <Dropdown.Item eventKey={category.id} key={category.id}>{category.name}</Dropdown.Item>
            ));
            updateStatistics(categoriesList[0].id);
        }));
    }, []);


    const dispatch = useDispatch()

    const updateStatistics = (categoryId) => {
        get_stat(categoryId).then((response) => response.json().then((stat) => {
            dispatch(changeCurrentStatistics(stat));
        }));
    }

    return (
        <Stack direction={"horizontal"} style={{marginTop: "10px"}}>
            <Dropdown onSelect={updateStatistics}>
                <Dropdown.Toggle variant="primary" id="dropdown-basic" style={{backgroundColor: "#1976d2"}}>
                    Категория
                </Dropdown.Toggle>
                <Dropdown.Menu>
                    {categoriesList}
                </Dropdown.Menu>
            </Dropdown>
        </Stack>
    );

}