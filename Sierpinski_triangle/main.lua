local font = love.graphics.newFont(25)
triangle_points = {{love.graphics.getWidth()/2, love.graphics.getHeight()/2 - 400}, {love.graphics.getWidth()/2 + 400, love.graphics.getHeight()/2 + 400},{love.graphics.getWidth()/2 - 400, love.graphics.getHeight()/2 + 400} }
points = {}
point = nill
function love.update(dt)
    local current_point = nill
    if love.keyboard.isDown('escape') then
        love.event.quit(0)
    end
    if point == nill then
        current_point = triangle_points[love.math.random(1,3)]
        start_point(current_point)
    else 
        for i=0 ,1000 do 
            current_point = triangle_points[love.math.random(1,3)]
            build_points(current_point)
        end
    end
end
function build_points(pos)
    local new_pos = {point[1] + (pos[1] -point[1] )/2, point[2] + (pos[2]-point[2])/2}
    table.insert(points, new_pos)
    point = new_pos
end
function start_point(pos)
    for _, i in ipairs(triangle_points) do
        if i ~= pos then
            local new_pos = {i[1] + (pos[1] -i[1] )/2, i[2] + (pos[2]-i[2])/2}
            table.insert(points, new_pos)
            point = new_pos
            break
        end
    end
end
function love.draw()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(0,0,0)
    love.graphics.setFont(font)
    love.graphics.print(#points, font)
    for _, i in ipairs(triangle_points) do
        love.graphics.circle('fill', i[1], i[2], 4)
    end
    for _, i in ipairs(points) do
        love.graphics.circle('fill', i[1], i[2], 0.1)
    end
end