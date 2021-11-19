async function getMissionDataPerYearData () {
    const URL = 'https://amexpert10.ddns.net/dashboard/missionperyear'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}
getMissionDataPerYearData().then(missions => {
    const years = missions.data.map(
        function (index) {
            return index.year
        })
    const totalMissionsPerYear = missions.data.map(
        function (index) {
            return index.total
        })
        missionsPerMonth.config.data.labels = years
        missionsPerMonth.config.data.datasets[0].data = totalMissionsPerYear
        missionsPerMonth.config.data.datasets[0].label = 'Mission(s) par An'
        missionsPerMonth.update()
        console.log(years)
})

async function getAmountWorkedPerYear () {
    const URL = 'https://amexpert10.ddns.net/dashboard/missionencashyear'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}

getAmountWorkedPerYear().then(amountPerYear => {
    const years = amountPerYear.data.map(
        function (index) {
            return index.year
        })
    const AmountPerYear = amountPerYear.data.map(
        function (index) {
            return index.total
        })
        totalAmountPerYear.config.data.labels = years
        totalAmountPerYear.config.data.datasets[0].data = AmountPerYear 
        totalAmountPerYear.config.data.datasets[0].label = 'Chiffre d\'affaire (€) par An'
        totalAmountPerYear.update()

        console.log(years)
})

// setup 
const data = {
    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    datasets: [{
    label: 'Mission par An',
    data: [18, 12, 6, 9, 12, 3, 9],
    backgroundColor: [
        'rgba(255, 26, 104, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
        'rgba(0, 0, 0, 0.2)'
    ],
    borderColor: [
        'rgba(255, 26, 104, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
        'rgba(0, 0, 0, 1)'
    ],
    borderWidth: 1
    }]
};

// config 
const config = {
    type: 'bar',
    data,
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                maintainAspectRatio: false,
                ticks: {
                    stepSize: 0
                }
            }
        },
    
    }
};

    // render init block
const missionsPerMonth = new Chart(
    document.getElementById('missionsPerMonth'),
    config
);

const totalAmountPerYear = new Chart(
    document.getElementById('totalAmountPerYear'),
    config
);

