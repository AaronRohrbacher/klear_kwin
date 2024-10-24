const setOpacity = (window) => {
    window.opacity = .75;
    return;
};
workspace.windowAdded.connect((window) => {
    let opacity = readConfig("opacity", 0.75)
    console.log(opacity)
    window.normalWindow && setOpacity(window);
});
