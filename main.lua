
KeyMap = {}
Options= {}
SelectedOption = {}
State = {}
Character = require "character"
Scene = require "scene"

GameStates = {
    title = function ()
        SelectedOption = 1
        Options = {
            {
                text = "Start Run",
                nextState = PlayerMoves.prerun
            },
            {
                text = "Exit Game",
                nextState = PlayerMoves.exit
            },
            {
                text = "About",
                nextState = PlayerMoves.about
            }
        }
        KeyMap = {
            escape  = PlayerMoves.exit,
            enter   = PlayerMoves.select,
            space   = PlayerMoves.select,
            w       = PlayerMoves.selectUp,
            up      = PlayerMoves.selectUp,
            down    = PlayerMoves.selectDown,
            s    = PlayerMoves.selectDown,
        }
        State = {
            draw = Draw.title,
            update = Update.title
        }
    end,
    running=function ()
        KeyMap = {
            w       = PlayerMoves.jump,
            up      = PlayerMoves.jump,
            space   = PlayerMoves.jump,
            a       = PlayerMoves.stand,
            left    = PlayerMoves.stand,
            s       = PlayerMoves.slide,
            down    = PlayerMoves.slide,
            d       = PlayerMoves.accel,
            right   = PlayerMoves.accel,
            p       = PlayerMoves.pause,
            escape  = PlayerMoves.pause
        }
        Character.Actions.run(Character)
        State = {
            draw = Draw.running,
            update = Update.running
        }
    end,
    pause = function ()
        SelectedOption = 1
        Options = {
            {
                text = "Resume",
                nextState = PlayerMoves.running
            },
            {
                text = "Exit from game",
                nextState = PlayerMoves.exit
            }
        }
        KeyMap = {
            w       = PlayerMoves.selectUp,
            up      = PlayerMoves.selectUp,
            space   = PlayerMoves.select,
            enter   = PlayerMoves.select,
            s       = PlayerMoves.selectDown,
            down    = PlayerMoves.selectDown,
            p       = PlayerMoves.unpause,
            escape  = PlayerMoves.unpause,
        }
    end,
    death=function ()
        
    end,
    gameover= function ()
        
    end,
    exit= function ()
        love.event.quit()
    end
}

PlayerMoves = {
    about = function ()
    end,
    prerun = function ()
        GameStates.running()
    end,
        
    jump = function()
        Character.Actions.jump(Character)
    end,
    accel= function()
        Character.Actions.jump(Character)
    end,
    stand= function ()
        
    end,
    slide=function ()
        
    end,
    pause=function ()
        
    end,
    exit=function ()
        love.event.quit()
    end,
    select=function ()
        if SelectedOption and Options[SelectedOption] then
            Options[SelectedOption].nextState()
        end
    end,
    selectUp=function ()
        if #Options >=1 and SelectedOption == 1 then
            SelectedOption = #Options
        else
            SelectedOption = SelectedOption -1
        end
    end,
    selectDown=function ()
        if #Options >=1 and SelectedOption == #Options then
            SelectedOption = 1
        else
            SelectedOption = SelectedOption + 1
        end
    end,
    unpause=function ()
        
    end
}

Draw = {
    title = function()
        if Options and #Options > 0 then
            for i, option in ipairs(Options) do
                local prefix = (i == SelectedOption) and "> " or "  "
                love.graphics.print(prefix .. option.text, 10, 10 + (i - 1) * 20)
            end
        end
    end,
    running = function ()
        love.graphics.clear(0.5, 0.5, 0.5)
        Character:draw()
        Scene:draw()
    end,

}

Update = {
    running = function (dt)
        Character:update(dt)
        Scene:update(dt)
    end,
    title = function()
        
    end,
}


love.keypressed = function(pressed_key)
    if KeyMap[pressed_key] then
        KeyMap[pressed_key]()
    end
end

function love.draw()
    if State.draw then 
        State.draw()
    end
end

function love.update(dt)
    if State.update then 
        State.update(dt)
    end
end
GameStates.title()