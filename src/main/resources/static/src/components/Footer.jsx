import React from 'react';

import {Col, Container, Row} from "react-bootstrap";
import Card from 'react-bootstrap/Card';
import css from "../css/scoreboard.css";

export default function Footer() {

    return (
        <Card id={css.Footer} className={`${css.pageWidth}`}>
            <Card.Body>
                <Container >
                    <Row>
                        <Col>
                            <p>Telegram: @nua4e</p>
                        </Col>
                        <Col>
                            <p>Email: vdovit@mail.ru</p>
                        </Col>
                    </Row>
                    <Row>
                        <Col>
                            <a href="https://github.com/Shakalyan/vk_test_2023"
                               target="_blank"
                               rel="noopener noreferrer">Репозиторий проекта</a>
                        </Col>
                    </Row>
                </Container>
            </Card.Body>
        </Card>
    );

}