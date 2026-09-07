local curveIdx = 0

local function updateCurve()
    local value = getValue("s1")

    curve = {}
    curve["x"] = {-100, 0, 100}
    curve["y"] = {-100, ((-100) + (value * (100.0 / 1024.0))) / 2, value * (100.0 / 1024.0)}
    curve["smooth"] = true
    curve["type"] = 1
    model.setGlobalVariable(8, 0, value * (100.0 / 1024.0) * 0.5 + 50)

    return model.setCurve(curveIdx, curve)
end

local function run(event)
    updateCurve()
    return 0
end

local function init(event)
    updateCurve()
    return 0
end

return {
    init = init,
    run = run,
    background = updateCurve
}
