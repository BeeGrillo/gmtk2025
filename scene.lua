local Scene = {
    offset = 0,
    backOffset = 0,
    totalLength = 0,
    pieces = {},
    init = function(self)
        for i=1, 20 do
            local piece = SetPiece()
            self.pieces[i] = piece
        end
        self.offset = 0
        self.totalLength = #self.pieces * 450
        self.backOffset = ((#self.pieces - 6)/2 + 2) * 450
    end,
    draw = function(self)
        love.graphics.setColor(200, 0, 0)
        love.graphics.line(0, 250, 900, 250) -- ground line
        -- for index, piece in ipairs(self.pieces) do 
        --     if piece.x + self.offset > -450 and piece.x + self.offset < 900 then
        --         piece:draw()
        --     elseif piece.x 
        -- end
    end,
    update = function(self, dt)

    end
}

SetPiece = function(type)

end



return Scene