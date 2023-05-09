import { CHANGE_TASK_CATEGORY } from './actions/changeTaskCategory.jsx'
import { UPDATE_CATEGORIES_LIST } from "./actions/updateCategoriesList.jsx";
import { CHANGE_CURRENT_STATISTICS } from "./actions/changeCurrentStatistics.jsx";

const initialState = {
    currentTasksCategory: 0,
    categoriesList: {},
    statistics: {}
}

export function reducer(state = initialState, action) {
    switch (action.type) {
        case (CHANGE_TASK_CATEGORY):
            return {
                ...state,
                currentTasksCategory: action.category
            }
        case (UPDATE_CATEGORIES_LIST):
            return {
                ...state,
                categoriesList: action.categoriesList
            }
        case (CHANGE_CURRENT_STATISTICS):
            return {
                ...state,
                statistics: action.statistics
            }
        default:
            return state;
    }
}