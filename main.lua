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
    ball.sprite = love.graphics.newImage('assets/images/arts/Ball.png')
    ball.width = ball.sprite:getWidth()
    ball.x = 200
    ball.y = 300
    ball.speed = 200
    ball.xvel = 0
    ball.yvel = 0
    if (0 < ball.x and ball.x < width) and ((0 < ball.y) and (ball.y< height)) then
        if (love.math.random(2) == 1) then
            ball.xvel = ball.speed
            ball.yvel = ball.speed
        end
        if (love.math.random(2) == -1) then
            ball.xvel = -ball.speed
            ball.yvel = -ball.speed
        end
    end
end

function love.update(dt)
    if player.y > 0 and love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    if player.y < (height - player.height) and love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
    ball.x = ball.x + ball.xvel*dt
    ball.y = ball.y + ball.yvel*dt
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(ball.sprite, ball.x, ball.y)
    love.graphics.draw(player.sprite, player.x, player.y)
end
