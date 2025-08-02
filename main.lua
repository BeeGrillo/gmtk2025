
KeyMap = {}
Options= {}
SelectedOption = 1
State = {}



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
            }
        }
        KeyMap = {
            escape  = PlayerMoves.exit,
            enter   = PlayerMoves.select,
            space   = PlayerMoves.select,
            w       = PlayerMoves.selectUp,
            up      = PlayerMoves.selectDown,
        }
    end,
    prerun = function ()
        
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
    end,
    pause = function ()
        SelectedOption = 1
        Options = {
            resume = {
                text = "Resume",
                nextState = PlayerMoves.running
            },
            quit = {
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
        
    end
}

PlayerMoves = {
    jump = function()

    end,
    accel= function()

    end,
    stand= function ()
        
    end,
    slide=function ()
        
    end,
    pause=function ()
        
    end,
    exit=function ()
        
    end,
    select=function ()
        
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

love.keypressed = function(pressed_key)
    if KeyMap[pressed_key] then
        KeyMap[pressed_key]()
    end
end

function love.draw()
    
    
end

function love.update(dt)

end