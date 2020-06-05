class Table {
    constructor(id, col) {
        this.id = id
        this.col = col
    }

    removeAll() {
        $(`#${this.id} tr:not(:first)`).remove();
        mdui.updateTables()
    }


    addAll(items) {
        items.forEach((item) => {
            console.log(item)
            let tr = document.createElement('tr')
            for (let key in item) {
                let value = item[key]
                let td = document.createElement('td')
                if (key === 'code' && value !== 'null') {
                    td.style.color = value
                    value = '████████'
                } else if (key === 'code') {
                    td.style.color = '#e3e3e3'
                    value = '████████'
                }
                td.innerHTML = value
                tr.appendChild(td)
            }
            $(`#${this.id}`).append(tr)
        })

        mdui.updateTables()
    }
}