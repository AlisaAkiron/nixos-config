const calendarWidget = Widget.Calendar({
    showDayNames: true,
    showDetails: true,
    showHeading: true,
    showWeekNumbers: true,
    className: "calendarWidget"
})

const CalendarWindow = Widget.Window({
    name: "calendar",
    className: "windows",
    anchor: ["top", "right"],
    visible: false,
    child: Widget.Box({
        css: 'padding: 1px',
        child: calendarWidget
    })
})

// Signal
App.connect("window-toggled", (_, name, visible) => {
    if (visible && name == 'calendar') {
        const d = new Date();
        calendarWidget.select_day(d.getDate()) 
        calendarWidget.select_month(d.getMonth(),d.getFullYear()) 
    }
})

// Config
let config = {
    style: "./style.css",
    windows: [
        CalendarWindow
    ],
    openWindowDelay: {
        'sidebar':100,
        'calendar':100,
    },
    closeWindowDelay: {
        'sidebar': 50,
        'calendar':50,
    },    
}

// Run AGS
App.config(config)
