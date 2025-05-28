function love.load()
    player = {}
    player.x = 0
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('assets/images/arts/Player.png')
    player.height = player.sprite:getHeight()
    background = love.graphics.newImage('assets/images/arts/Board.png')
    width = background:getWidth()
    height = background:getHeight()
    print(height)
    love.window.setMode(width, height)
    ball = {}
    ball.x = 300
    ball.y = 200
    ball.speed = 10
    ball.sprite = love.graphics.newImage('assets/images/arts/Ball.png')
    ball.width = ball.sprite:getWidth()
end

function love.update(dt)
    if player.y > 0 and love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    if player.y < (height - player.height) and love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(ball.sprite,( width - ball.width)/2, height/2)
    love.graphics.draw(player.sprite, player.x, player.y)
end