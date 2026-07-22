-- =============================================================================
-- CROWN MENU — Theme Loader Snippet
-- Paste this at the top of your client.lua to enable web-loaded themes.
-- =============================================================================

local theme = nil

local function defaultTheme()
    -- Built-in fallback (exact copy of default-theme.lua)
    return {
        colors = {
            background      = { 10,  10,  10, 200 },
            titleBar        = {  0,   0,   0, 200 },
            footer          = {  0,   0,   0, 255 },
            descriptionBar  = {  0,   0,   0, 200 },
            highlight = {
                default = {240,   0,   0, 130 },
                black   = { 60,  60,  60, 130 },
                crown   = {  0, 217, 255, 130 },
                viper   = {187, 165,  61, 100 },
                altar   = {  0, 120,  30, 100 },
            },
            text = {
                primary      = {255, 255, 255, 255 },
                value        = {255, 255, 255, 255 },
                boolOn       = {  0, 255, 180, 255 },
                arrow        = {255, 255, 255, 180 },
                counter      = {255, 255, 255, 255 },
                description  = {255, 255, 255, 255 },
            },
            toggle = {
                bgOff        = {210, 210, 210, 255 },
                bgOn         = { 80, 180, 255, 255 },
                special      = {255, 140,   0, 255 },
                shadow       = {  0,   0,   0,  60 },
                bodyFill     = 230,
                border       = {120, 120, 120,  90 },
                knob         = {255, 255, 255, 255 },
                knobBorder   = {180, 180, 180,  80 },
            },
            healthBar = {
                bg      = { 90,  90,  90, 180 },
                fill    = { 50, 220,  50, 230 },
            },
            armorBar = {
                bg      = { 90,  90,  90, 180 },
                fill    = { 60, 120, 255, 230 },
            },
            crosshair = { 255, 0, 0, 220 },
            controlHintBg = { 0, 0, 0, 170 },
        },
        positions = {
            menuY               = 0.265,
            menuWidth           = 0.18,
            optionHeight        = 0.027,
            maxVisible          = 8,
            logoHeight          = 0.09,
            logoWidth           = 0.18,
            bannerToOptionsGap  = 0.034,
            precisionOffset     = 0.0005,
            titleBarHeight      = 0.03,
            titleBarAdjusted    = 0.022,
            descBarHeight       = 0.025,
            footerHeight        = 0.025,
            textPadding         = 0.004,
            textPaddingOptions  = 0.006,
            textPaddingMenu     = 0.008,
            toggleWidth         = 0.020,
            toggleHeight        = 0.012,
            valueCenterOffset   = 0.024,
            toggleOffsetX       = 0.020,
            arrowIndicator      = 0.018,
            leftArrowPos        = 0.038,
            rightArrowPos       = 0.008,
            valueTextX          = 0.024,
            infoPanelWidth      = 0.12,
            infoPanelLineHeight = 0.025,
            infoPanelSeparator  = 0.0037,
            infoPanelValueX     = 0.004,
            barHeight           = 0.012,
            barWidth            = 0.0012,
            barYOffset          = 0.0027,
            separatorHeight     = 0.002,
        },
        scales = {
            tabTitle            = 0.28,
            optionLabel         = 0.26,
            optionValue         = 0.26,
            footerBuild         = 0.25,
            footerName          = 0.25,
            description         = 0.22,
            playerInfoName      = 0.36,
            playerInfoFields    = 0.26,
            counter             = 0.28,
            freecamActions      = 0.65,
            freecamActionsAlt   = 0.40,
            freecamDeleteHint   = 0.50,
            controlHints        = 0.28,
        },
        fonts = { primary = 4 },
        animation = {
            fadeSpeed           = 0.12,
            highlightLerpSpeed  = 18,
            toggleSpeed         = 0.18,
            toggleDeltaMult     = 12,
            toggleDeltaMax      = 18,
        },
        navigation = {
            initialDelayMs      = 500,
            repeatFastMs        = 40,
            repeatSlowMs        = 120,
            accelSteps          = 5,
        },
    }
end

-- Load theme from web
local function loadTheme(url)
    PerformHttpRequest(url or "https://raw.githubusercontent.com/GluOz/core-mn-oxb/refs/heads/main/default-theme.lua",
        function(err, text, hdr)
            if text and text ~= "" then
                local f, err = load(text)
                if f then
                    local ok, t = pcall(f)
                    if ok and type(t) == "table" then
                        theme = t
                        print("[Crown Menu] Theme loaded from web")
                        return
                    end
                end
            end
            theme = defaultTheme()
            print("[Crown Menu] Using fallback theme")
        end,
        "GET"
    )
end

loadTheme()

-- Helper function: get theme value with fallback into default
-- Usage: T("positions.menuY") or T("colors.text.primary")
local function T(path)
    if not theme then
        -- Fall back to defaults while loading
        local def = defaultTheme()
        local v = def
        for part in string.gmatch(path, "[^.]+") do
            v = v[part]
            if not v then return nil end
        end
        return v
    end
    local v = theme
    for part in string.gmatch(path, "[^.]+") do
        v = v[part]
        if not v then return nil end
    end
    return v
end
