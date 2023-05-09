export const CHANGE_TASK_CATEGORY = 'CHANGE_TASK_CATEGORY'

export function changeTaskCategory(category) {
    return {
        type: CHANGE_TASK_CATEGORY,
        category: category
    }
}