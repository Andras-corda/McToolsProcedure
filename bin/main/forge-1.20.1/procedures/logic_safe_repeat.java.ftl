{
    int _srCount = Math.min(100000, Math.max(0, ${opt.toInt(input$count)}));
    for (int _srI = 0; _srI < _srCount; _srI++) {
        ${statement$body}
    }
}
