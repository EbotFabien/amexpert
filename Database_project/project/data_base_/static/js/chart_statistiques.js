
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
        missionsPerYear.config.data.labels = years
        missionsPerYear.config.data.datasets[0].data = totalMissionsPerYear
        missionsPerYear.config.data.datasets[0].label = 'Mission(s) par An'
        missionsPerYear.update()
})

async function getAmountWorkedPerYear (type="bar") {
    const URL = 'https://amexpert10.ddns.net/dashboard/missionencashyear'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}

getAmountWorkedPerYear(type="bar").then(amountPerYear => {
    const years = amountPerYear.data.map(
        function (index) {
            return index.year
        })
    const AmountPerYear = amountPerYear.data.map(
        function (index) {
            return index.total
        })
        totalAmountPerYear.config.data.labels = years
        totalAmountPerYear.config.type = "line"
        totalAmountPerYear.config.data.datasets[0].data = AmountPerYear 
        totalAmountPerYear.config.data.datasets[0].label = 'Chiffre d\'affaire (€) par An'
        totalAmountPerYear.update()
})

async function getMissionsPerMonth () {
    const URL = 'https://amexpert10.ddns.net/dashboard/missionpermonth'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}

getMissionsPerMonth().then(amountPerMonth => {
    const months = amountPerMonth.data.map(
        function (index) {
            return index.month
        })
    const total = amountPerMonth.data.map(
        function (index) {
            return index.total
        })
    missionsPerMonth.config.data.labels = months
    missionsPerMonth.config.data.datasets[0].data  = total
    missionsPerMonth.config.data.datasets[0].label = 'Mission(s) par Mois'
    missionsPerMonth.update()
})

async function getExpertTotalPerMonth () {
    const URL = 'https://amexpert10.ddns.net/dashboard/expertencashpermonth'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}

getExpertTotalPerMonth().then(amountPerMonth => {
    const months = amountPerMonth.data.map(
        function (index) {
            return index.month
        })
    const total = amountPerMonth.data.map(
        function (index) {
            return index.total
        })
    expertTotalPerMonth.config.data.labels = months
    expertTotalPerMonth.config.data.datasets[0].data  = total
    expertTotalPerMonth.config.data.datasets[0].label = 'Chiffre d\'affaire (€) par mois sur l\'année en cours'
    expertTotalPerMonth.update()
})


async function getExpertTotalPerYear () {
    const URL = 'https://amexpert10.ddns.net/dashboard/expertencashperyear'
    const response = await fetch(URL)
    const datapoints = await response.json()
    return datapoints
}

getExpertTotalPerYear().then(amountPerMonth => {
    const year = amountPerMonth.data.map(
        function (index) {
            return index.year
        })
    const total = amountPerMonth.data.map(
        function (index) {
            return index.total
        })
    expertTotalPerMonth.config.data.labels = year
    expertTotalPerMonth.config.data.datasets[0].data  = total
    expertTotalPerMonth.config.data.datasets[0].label = 'Chiffre d\'affaire (€) par An'
    expertTotalPerMonth.update()
})
// setup 
const data = {
    type:'',
    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    datasets: [{
    label: '',
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
    borderWidth: .5
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
const missionsPerYear = new Chart(
    document.getElementById('missionsPerYear'),
    config
);

const missionsPerMonth = new Chart(
    document.getElementById('missionsPerMonth'),
    config
);

const totalAmountPerYear = new Chart(
    document.getElementById('totalAmountPerYear'),
    config
);

const expertTotalPerMonth = new Chart(
    document.getElementById('expertTotalPerMonth'),
    config
);


const expertTotalPerYear = new Chart(
    document.getElementById('expertTotalPerYear'),
    config
);

