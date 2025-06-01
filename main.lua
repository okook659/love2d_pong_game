function love.load()
    player = {}
    player.x = 0
    player.y = 200
    player.speed = 300
    player.sprite = love.graphics.newImage('assets/images/arts/Computer.png')
    player.height = player.sprite:getHeight()
    player.width = player.sprite:getWidth()
    background = love.graphics.newImage('assets/images/arts/Board.png')
    width = background:getWidth()
    height = background:getHeight()
    love.window.setMode(width, height)
    ball = {}
    ball.sprite = love.graphics.newImage('assets/images/arts/Ball.png')
    ball.width = ball.sprite:getWidth()
    ball.height = ball.sprite:getHeight()
    ball.x = 200
    ball.y = 300
    ball.speed = 500
    ball.xvel = 200
    ball.yvel = 200
    score = 0
    font = love.graphics.newFont(32)
end

function love.update(dt)
    --Mouvement du joueur
    if love.keyboard.isDown("up") and player.y > 0 then
        player.y = player.y - player.speed*dt
    end
    if love.keyboard.isDown("down") and player.y + player.height < height then
        player.y = player.y + player.speed*dt
    end

    --Mouvement de la balle
    ball.x = ball.x + ball.xvel*dt
    ball.y = ball.y + ball.yvel*dt

    if ball.y <= 0 or ball.y + ball.height > height then
        ball.yvel = -ball.yvel
    end
    if ball.x <= 0 or ball.x + ball.width > width then
        ball.xvel = -ball.xvel
    end

    if ball.x <= player.x + player.width and
       ball.y + ball.height >= player.y and
       ball.y <= player.y + player.height then
        ball.xvel = -ball.xvel
        ball.x = player.x + player.width
        score = score + 1
    end

    if ball.x < 0 then
    ball.x = width / 2
    ball.y = height / 2
    ball.speed = 200 -- 🔁 Remet la vitesse de base
    ball.xvel = ball.speed
    ball.yvel = (love.math.random(2) == 1 and ball.speed or -ball.speed)
    score = 0 -- 🔁 Réinitialise le score
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(ball.sprite, ball.x, ball.y)
    love.graphics.draw(player.sprite, player.x, player.y)
    love.graphics.setFont(font)
    love.graphics.setColor(1, 1, 1) -- couleur blanche (R, G, B)
    love.graphics.print("Score: " .. score, 10, 10)
end
