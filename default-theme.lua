-- =============================================================================
-- CROWN MENU — Default Theme
-- Host this file on pastebin / gist, load via PerformHttpRequest in client.lua
-- =============================================================================
-- All visual tokens live here. Users edit ONLY this file to customize the menu.
-- client.lua references theme.* values instead of hardcoded numbers.
-- =============================================================================

return {
    -- Color Palette ----------------------------------------------------------
    colors = {
        -- Main panels
        background      = { 10,  10,  10, 200 },  -- Main menu background
        titleBar        = {  0,   0,   0, 200 },  -- Title bar at top
        footer          = {  0,   0,   0, 255 },  -- Footer bar (build, name)
        descriptionBar  = {  0,   0,   0, 200 },  -- Description / hints bar
        playerPanel     = { 18,  18,  18, 220 },  -- Player info panel (ESP)
        separator       = {120, 120, 120, 180 },  -- Info panel separator line

        -- Highlight / selection (6 themes)
        highlight = {
            default = {240,   0,   0, 130 },  -- Red
            black   = { 60,  60,  60, 130 },  -- Dark gray
            anim    = {200,   0,   0, 130 },  -- Red (alt)
            crown   = {  0, 217, 255, 130 },  -- Cyan
            viper   = {187, 165,  61, 100 },  -- Gold
            altar   = {  0, 120,  30, 100 },  -- Green
        },

        -- Text
        text = {
            primary      = {255, 255, 255, 255 },  -- Option labels
            value        = {255, 255, 255, 255 },  -- List / float / int values
            boolOn       = {  0, 255, 180, 255 },  -- ON state for bools
            boolOff      = {255, 255, 255, 255 },  -- OFF state for bools
            arrow        = {255, 255, 255, 180 },  -- > / arrows (low opacity)
            counter      = {255, 255, 255, 255 },  -- Page counter
            description  = {255, 255, 255, 255 },  -- Description bar text
            title        = {255, 255, 255, 255 },  -- Tab title
            footerBuild  = {255, 255, 255, 255 },  -- Build version in footer
            footerName   = {255, 255, 255, 255 },  -- Player name in footer
            infoLabel    = {255, 255, 255, 220 },  -- Player info panel labels
            infoValue    = {255, 255, 255, 220 },  -- Player info panel values
        },

        -- Toggle switch
        toggle = {
            bgOff        = {210, 210, 210, 255 },  -- Off background
            bgOn         = { 80, 180, 255, 255 },  -- On background
            special      = {255, 140,   0, 255 },  -- Special (orange) state
            shadow       = {  0,   0,   0,  60 },  -- Drop shadow
            bodyFill     = 230,                     -- Body fill opacity
            border       = {120, 120, 120,  90 },  -- Border
            knob         = {255, 255, 255, 255 },  -- Knob white
            knobBorder   = {180, 180, 180,  80 },  -- Knob border/shadow
        },

        -- Health & Armor bars (player info)
        healthBar = {
            bg      = { 90,  90,  90, 180 },
            fill    = { 50, 220,  50, 230 },  -- Green
        },
        armorBar = {
            bg      = { 90,  90,  90, 180 },
            fill    = { 60, 120, 255, 230 },  -- Blue
        },

        -- Freecam crosshair
        crosshair = { 255, 0, 0, 220 },

        -- Control hint background (freecam / noclip)
        controlHintBg = { 0, 0, 0, 170 },
    },

    -- Positioning & Sizing ---------------------------------------------------
    positions = {
        -- Menu position
        menuY               = 0.265,  -- Fixed Y offset from screen top
        menuWidth           = 0.18,   -- Default menu width (settings range 0.16-0.22)
        optionHeight        = 0.027,  -- Height per option row
        maxVisible          = 8,      -- Max options before scrolling

        -- Banner / logo
        logoHeight          = 0.09,
        logoWidth           = 0.18,
        bannerToOptionsGap  = 0.034,  -- Gap between banner bottom and first option
        precisionOffset     = 0.0005, -- Tiny adjustment for options Y start

        -- Title bar
        titleBarHeight      = 0.03,
        titleBarAdjusted    = 0.022,  -- Used in title rendering

        -- Bottom bars
        descBarHeight       = 0.025,
        footerHeight        = 0.025,

        -- Text padding (from menu edge)
        textPadding         = 0.004,  -- General left padding
        textPaddingOptions  = 0.006,  -- Settings left padding
        textPaddingMenu     = 0.008,  -- Submenu option left padding

        -- Value / toggle area
        toggleWidth         = 0.020,
        toggleHeight        = 0.012,
        valueCenterOffset   = 0.028,  -- menuX + width/2 - this = value text center
        toggleOffsetX       = 0.020,  -- toggle X offset from menu right edge

        yTextOffset         = 0.008,

        -- Arrow positions (from menu right edge: menuX + width/2)
        arrowIndicator      = 0.018,  -- ">" position
        leftArrowPos        = 0.040,  -- ← position
        rightArrowPos       = 0.010,  -- → position
        valueTextX          = 0.028,  -- Value text X offset (fallback)

        -- Player info panel (ESP)
        infoPanelWidth      = 0.12,
        infoPanelLineHeight = 0.025,
        infoPanelSep        = 0.0037, -- Left column separator offset
        infoPanelValueX     = 0.004,  -- Right column offset

        -- Health / armor bars
        barHeight           = 0.012,
        barWidth            = 0.0012,
        barYOffset          = 0.0027,
        separatorHeight     = 0.002,
    },

    -- Typography -------------------------------------------------------------
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
        freecamActions      = 0.65,   -- Selected freecam action
        freecamActionsAlt   = 0.40,   -- Non-selected freecam action
        freecamDeleteHint   = 0.50,   -- "Click to delete"
        controlHints        = 0.28,   -- Freecam / noclip control texts
    },

    fonts = {
        primary = 4,  -- All menu text uses font 4
    },

    -- Animation --------------------------------------------------------------
    animation = {
        fadeSpeed           = 0.12,
        highlightLerpSpeed  = 18,
        toggleSpeed         = 0.18,
        toggleDeltaMult     = 12,
        toggleDeltaMax      = 18,
    },

    -- Navigation -------------------------------------------------------------
    navigation = {
        initialDelayMs      = 500,
        repeatFastMs        = 40,
        repeatSlowMs        = 120,
        accelSteps          = 5,
    },
}
