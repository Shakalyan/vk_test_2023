export const CHANGE_CURRENT_STATISTICS = 'CHANGE_CURRENT_STATISTICS';

export function changeCurrentStatistics(stat) {
    return {
        type: CHANGE_CURRENT_STATISTICS,
        statistics: stat
    }
}