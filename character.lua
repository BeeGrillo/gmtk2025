Shapes = {
    running = {{0,0,0,32,32,32,32,0},{2,2,34,-2,34,32,-2,32},{10,10,40,6,36,32,-4,32}},
    prejump = {{6,10,26,10,40,32,-8,32}},
    ascending = {{8,-8,24,-8,28,32,-4,32}},
    midair = {{0,0,0,32,32,32,32,0}},
    falling = {{4,-8,28,-8,24,32,8,32}},
}


local Character = {
    shape = Shapes.running,
    animation = 1,
    animationTime = 1/12,
    animationTimer = 0,
    fixture = {},
    body = {},
    x = 50,
    y = 250-32,
    width = 32,
    height = 32,
    verticalSpeed = 0,
    horizontalSpeed = 0,
    jumpSpeed = 100,
    fallAcceleration = 50,
    state="running",
    States = {
        "running",
        "jumping",
        "standing",
        "falling",
        "sliding",
        "paused",
        "dashing",
    },
    image = nil,
    Actions = {
        jump = function(self)
            if self.state == "running" or self.state == "standing" or self.state == "dashing" then
                if self.state == "dashing" then
                    self.verticalSpeed = -1.5* self.jumpSpeed 
                else
                    self.verticalSpeed = -self.jumpSpeed
                end
                self.horizontalSpeed = 0;
                self.state = "jumping"
                self.shape = Shapes.prejump
                self.animation = 1
            end
        end,
        stand = function(self)
            if self.state == "running" and self.x > 100 then
                self.hotizontalSpeed = -50
                self.state = "standing"
            end
        end,
        dash = function(self)
            if self.state == "running" or self.state == "standing" then
                self.horizontalSpeed = 50
                self.verticalSpeed = 0
                self.state = "dashing"
            end
        end,
        land = function(self)
            if self.state == "jumping" then
                self.verticalSpeed = 0
                self.y = 218
                self.state = "running"
                self.shape = Shapes.running
                self.animation = 1
            end
        end,
        run = function(self)
            if self.state == "standing" or self.state == "running" then
                self.horizontalSpeed = 0
                self.shape = Shapes.running
                self.animation = 1
                self.state = "running"
            end
        end,
    },
    draw = function(self)
        local shape = {}
        for index, value in ipairs(self.shape[self.animation]) do
            if (index % 2 == 0) then
                shape[index] = value + self.y
            else
                shape[index] = value + self.x
            end
        end
        love.graphics.setColor(0, 150, 0)
        love.graphics.polygon("fill", shape )
    end,
    update = function(self, dt)
        if #self.shape > 1 then
            self.animationTimer = self.animationTimer + dt
            if self.animationTimer > self.animationTime then
                self.animation = (self.animation % #self.shape) +1
                self.animationTimer = 0
            end
        end

        if self.state == "jumping" then
            self.animationTimer = self.animationTimer + dt
            if self.animationTimer > self.animationTime * 4 and self.shape == Shapes.prejump then
                self.animation = 1
                self.shape = Shapes.ascending
                self.animationTimer = 0
            elseif self.animationTimer > self.animationTime and self.shape == Shapes.ascending then
                self.shape = Shapes.midair
                self.animation = 1
                self.animationTimer = 0
            elseif self.verticalSpeed > 0 and self.shape == Shapes.midair then
                self.shape = Shapes.falling
                self.animationTimer = 0
                self.animation = 1
            end
                
            if self.y > 218 then
                self.Actions.land(self)
            else
                self.verticalSpeed = self.verticalSpeed + self.fallAcceleration * dt
            end
        end
        if self.state == "dashing" then
            if self.horizontalSpeed <= 0 then
                self.Actions.run(self)
            else
                self.x = self.x + self.horizontalSpeed * dt
                self.horizontalSpeed = self.horizontalSpeed - 10 * dt
            end
        end
        self.x = self.x + self.horizontalSpeed * dt
        if self.y + self.verticalSpeed * dt > 218 then
            self.Actions.land(self)
        else
            self.y = self.y + self.verticalSpeed * dt
        end
    end
}


return Character