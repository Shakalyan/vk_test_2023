export const UPDATE_CATEGORIES_LIST = 'UPDATE_CATEGORIES_LIST';

export function updateCategoriesList(categoriesList) {
    return {
        type: UPDATE_CATEGORIES_LIST,
        categoriesList: categoriesList
    }
}