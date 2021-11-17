async function getMissionDataPerYearData () {
    const URL = 'https://amexpert10.ddns.net/dashboard/missionperyear'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}
getMissionDataPerYearData().then(missions => {
    console.log(missions)
    const Years = missions
})
