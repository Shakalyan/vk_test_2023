import React from 'react';
import {useSelector} from "react-redux";

import {Doughnut} from 'react-chartjs-2';
import { Chart as ChartJS, ArcElement, Tooltip } from 'chart.js';
import {Stack} from "react-bootstrap";
import Card from "react-bootstrap/Card";

ChartJS.register(ArcElement, Tooltip);

export default function Scoreboard() {

    const statistics = useSelector((state) => state.statistics);
    const categoryName = statistics.categoryName;
    const completed = parseInt(statistics.completedTasksCount);
    const total = parseInt(statistics.totalTasksCount);
    const place = parseInt(statistics.place);
    const totalParticipants = parseInt(statistics.totalParticipantsCount);

    const data = {
        labels: ['Решено', 'Не решено'],
        datasets: [
            {
                label: 'Задач',
                data: [completed, total - completed],
                percents: completed / total * 100,
                backgroundColor: [
                    '#6AE95F',
                    '#F0EEEE'
                ],
                borderColor: [
                    '#6AE95F',
                    '#F0EEEE'
                ],
                borderWidth: 1,
            },
        ],
    };

    const plugins = [{
        beforeDraw: function(chart) {
            let width = chart.width,
                height = chart.height,
                ctx = chart.ctx;
            ctx.restore();
            let fontSize = (height / 160).toFixed(2);
            ctx.font = fontSize + "em sans-serif";
            ctx.textBaseline = "top";
            let percents =  chart.data.datasets[0].percents.toFixed(1),
                text = `${percents}%`,
                metrics = ctx.measureText(text),
                actualWidth = metrics.width,
                actualHeight = metrics.actualBoundingBoxAscent + metrics.actualBoundingBoxDescent,
                textX = Math.round((width - actualWidth) / 2),
                textY = Math.round(height / 2 - actualHeight / 2);
            ctx.fillText(text, textX, textY);
            ctx.save();
        }
    }]

    let statisticsText;
    if (completed > 0) {
        statisticsText = (
            <div>
                <p className="h6 text-black">Задач выполнено: {completed} из {total}</p>
                <p className="h6 text-black">Вы на {place} месте среди {totalParticipants} сотрудников, решавших задачи из данной категории!</p>
            </div>
        );
    } else {
        statisticsText = (
            <p className="h6 text-black">Вы не решили ни одной задачи в данной категории</p>
        );
    }

    return (
        <Stack direction="horizontal" gap={5} style={{marginTop: "50px"}}>
            <div style={{width: "300px", height: "300px"}}>
                <Doughnut data={data}
                          plugins={plugins}
                          options={{maintainAspectRatio: false}}/>
            </div>
            <Card style={{height: "300px", width: "100%"}}>
                <Card.Body style={{height: "100%"}}>
                    <Stack>
                        <p className="h5 text-black"><b>Категория: {categoryName}</b></p>
                        {statisticsText}
                    </Stack>
                </Card.Body>
            </Card>
        </Stack>
    );

}