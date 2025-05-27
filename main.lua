function love.load()
    player = {}
    player.x = 0
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('assets/images/arts/Player.png')
    background = love.graphics.newImage('assets/images/arts/Board.png')
    width = background:getWidth()
    height = background:getHeight()
    love.window.setMode(width, height)
    ball = {}
    ball.x = 300
    ball.y = 200
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(player.sprite, player.x, player.y)
end