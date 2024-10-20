const setOpacity = (window) => {
    window.opacity = .75;
    return;
}

workspace.windowAdded.connect((window) => {
    if(window.normalWindow) {
        setOpacity(window);
    }
});
