if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
  end



function love.load()
    love.window.setMode(800,400)
    Viewport = love.graphics.newCanvas(400,400)
    MapView = love.graphics.newCanvas(400,400)
    
end


function love.draw()
    love.graphics.setCanvas(Viewport)
    love.graphics.print("Hello World!", 200, 200)
    love.graphics.setCanvas(MapView)
    love.graphics.print("Hello World!", 200, 200)
    love.graphics.setCanvas()
    love.graphics.draw(MapView,0,0)
    love.graphics.draw(Viewport,400,0)
    
end


function love.update()
end


--sits at the bottom of our script
local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end